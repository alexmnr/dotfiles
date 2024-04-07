if [ -d /opt/ros/humble/ ]; then
  source /opt/ros/humble/setup.zsh &> /dev/null
fi
if [ -d /opt/ros/iron/ ]; then
  source /opt/ros/iron/setup.zsh &> /dev/null
fi
if [ -d $HOME/Robot-Arm/ros/test_ws/install/ ]; then
  source $HOME/Robot-Arm/ros/test_ws/install/setup.zsh
fi
if [ -d $HOME/Robot-Arm/ros/arctos_ws/install/ ]; then
  source $HOME/Robot-Arm/ros/arctos_ws/install/setup.zsh
fi
if [ -d $HOME/Robot-Arm/ros/moveit_ws/install/ ]; then
  source $HOME/Robot-Arm/ros/moveit_ws/install/setup.zsh
fi
if [ -d $HOME/anytrack//install/ ]; then
  source $HOME/anytrack/install/setup.zsh
fi

eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"
