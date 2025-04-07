# source ros distro
source /opt/ros/jazzy/setup.zsh &> /dev/null

# source ros workspace(s)
source $HOME/Robot-Arm/ros/v2_ws/install/local_setup.zsh

# autocompletion
if command -v register-python-argcomplete3 &> /dev/null; then
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
fi
if command -v register-python-argcomplete &> /dev/null; then
  eval "$(register-python-argcomplete ros2)"
  eval "$(register-python-argcomplete colcon)"
fi
