if [ -d /opt/ros/humble/ ]; then
  source /opt/ros/humble/setup.zsh &> /dev/null
fi
if [ -d /opt/ros/iron/ ]; then
  source /opt/ros/iron/setup.zsh &> /dev/null
fi
if [ -d $HOME/Robot-Arm/ros/install/ ]; then
  source $HOME/Robot-Arm/ros/install/setup.zsh
fi
if [ -d $HOME/arctos_ws/install/ ]; then
  source $HOME/arctos_ws/install/setup.zsh
fi
if [ -d $HOME/moveit_ws/install/ ]; then
  echo "test"
  source $HOME/moveit/install/setup.zsh
fi

eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
