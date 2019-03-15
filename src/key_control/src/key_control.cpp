#include <termios.h>
#include <signal.h>
#include <sys/poll.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include <ros/ros.h>
#include <std_msgs/String.h>
#include <boost/thread/thread.hpp>


const char KEYBOARD_w=0x77;
const char KEYBOARD_a=0x61;
const char KEYBOARD_s=0x73;
const char KEYBOARD_d=0x64;
const char KEYBOARD_e=0x65;
const char KEYBOARD_q=0x71;

const char KEYBOARD_A_CAP=0x41;
const char KEYBOARD_D_CAP=0x44;
const char KEYBOARD_S_CAP=0x53;
const char KEYBOARD_W_CAP=0x57;
const char KEYBOARD_E_CAP=0x45;
const char KEYBOARD_Q_CAP=0x51;


class KeyControlNode {
private:
    double walk_vel_;
    double run_vel_;
    double yaw_rate_;
    double yaw_rate_run_;
    double walk_vel_y;
    double run_vel_y;

    ros::NodeHandle n_;
    ros::Publisher pub_;

public:
    KeyControlNode() {
        pub_ = n_.advertise<std_msgs::String>("base_cmd", 1);

        ros::NodeHandle n_private("~");
        n_private.param("walk_vel", walk_vel_, 0.3);
        n_private.param("run_vel", run_vel_, 0.3);
        n_private.param("walk_vel_y", walk_vel_y, 0.2);
        n_private.param("run_vel_y", run_vel_y, 0.2);
        n_private.param("yaw_rate", yaw_rate_, 0.1);
        n_private.param("yaw_rate_run", yaw_rate_run_, 0.3);
    }

    ~KeyControlNode()
    {
    }
	
    void keyboardLoop();

    void stopRobot() {
        std_msgs::String cmd;
        cmd.data = std::string("m 0.0 0.0 0.0");
        pub_.publish(cmd);
    }
};


int kfd = 0;
struct termios cooked, raw;
bool done;


void KeyControlNode::keyboardLoop() {
    char c;
    double max_tv = walk_vel_;
    double max_rv = yaw_rate_;
    double max_tv_y = walk_vel_y;
    int speed = 0;
    int speedy = 0;
    int turn = 0;

    // get the console in raw mode
    tcgetattr(kfd, &cooked);
    memcpy(&raw, &cooked, sizeof(struct termios));
    raw.c_lflag &= ~(ICANON | ECHO);
    raw.c_cc[VEOL] = 1;
    raw.c_cc[VEOF] = 2;
    tcsetattr(kfd, TCSANOW, &raw);

    puts("Reading from keyboard");
    puts("Use WASD keys to control the robot");
    puts("Press Shift to move faster");

    struct pollfd ufd;
    ufd.fd = kfd;
    ufd.events = POLLIN;

    for (;;) {
        boost::this_thread::interruption_point();

        // get the next event from the keyboard
        int num;

        if ((num = poll(&ufd, 1, 350)) < 0) {
            perror("poll():");
            return;
        } else if (num > 0) {
            if (read(kfd, &c, 1) < 0) {
                perror("read():");
                return;
            } else {
                switch (c) {
                case KEYBOARD_w:
                    max_tv = walk_vel_;
                    speed = 1;
                    speedy = 0;
                    turn = 0;
                    break;
                case KEYBOARD_s:
                    max_tv = walk_vel_;
                    speed = -1;
                    speedy = 0;
                    turn = 0;
                    break;
                case KEYBOARD_q:
                    max_rv = yaw_rate_;
                    speed = 0;
                    speedy = 0;
                    turn = 1;
                    break;
                case KEYBOARD_e:
                    max_rv = yaw_rate_;
                    speed = 0;
                    speedy = 0;
                    turn = -1;
                    break;
                case KEYBOARD_a:
                    max_tv_y = walk_vel_y;
                    speed = 0;
                    speedy = 1;
                    turn = 0;
                    break;
                case KEYBOARD_d:
                    max_tv_y = walk_vel_y;
                    speed = 0;
                    speedy = -1;
                    turn = 0;
                    break;

                case KEYBOARD_W_CAP:
                    max_tv = run_vel_;
                    speed = 1;
                    speedy = 0;
                    turn = 0;
                    break;
                case KEYBOARD_S_CAP:
                    max_tv = run_vel_;
                    speed = -1;
                    speedy = 0;
                    turn = 0;
                    break;
                case KEYBOARD_Q_CAP:
                    max_rv = yaw_rate_run_;
                    speed = 0;
                    speedy = 0;
                    turn = 1;
                    break;
                case KEYBOARD_E_CAP:
                    max_rv = yaw_rate_run_;
                    speed = 0;
                    speedy = 0;
                    turn = -1;
                    break;
                case KEYBOARD_A_CAP:
                    max_tv_y = run_vel_y;
                    speed = 0;
                    speedy = 1;
                    turn = 0;
                    break;
                case KEYBOARD_D_CAP:
                    max_tv_y = run_vel_y;
                    speed = 0;
                    speedy = -1;
                    turn = 0;
                    break;

                default:
                    max_tv = walk_vel_;
                    max_tv_y = walk_vel_y;
                    max_rv = yaw_rate_;
                    speed = 0;
                    speedy = 0;
                    turn = 0;
                }

                char buff[20];
                memset(buff, 0, 20);
                sprintf(buff, "m  %.2f %.2f %.2f", max_tv * speed, max_tv_y * speedy, max_rv * turn);

                std_msgs::String cmd;
                cmd.data = std::string(buff);
                pub_.publish(cmd);
            }

        }

    }
}



int main(int argc, char** argv) {
    ros::init(argc, argv, "KeyControl");
    KeyControlNode tbk;
    KeyControlNode* p = &tbk;

    boost::thread t(boost::bind(&KeyControlNode::keyboardLoop, p));

    ros::spin();

    t.interrupt();
    t.join();
    tbk.stopRobot();
    tcsetattr(kfd, TCSANOW, &cooked);

    return (0);
}

