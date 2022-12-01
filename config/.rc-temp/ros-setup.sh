source /opt/ros/humble/setup.zsh &> /dev/null
source /home/ALEX/3dev/ros/install/setup.zsh &> /dev/null

eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"

if [ -d /home/ALEX/3dev/docker ]; then
    path+=(/home/ALEX/3dev/docker)
fi

if [ -d /root/3dev/docker ]; then
    path+=(/root/3dev/docker)
fi

