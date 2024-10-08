if [ -d /opt/ros/humble/ ]; then
  source /opt/ros/humble/setup.zsh &> /dev/null
fi
if [ -d $HOME/Robot-Arm/ros/arctos_ws/install/ ]; then
  source $HOME/Robot-Arm/ros/arctos_ws/install/local_setup.zsh
fi

# export CC=clang
# export CXX=clang++
# export CLANG_BASE="--build-base build_clang --install-base install_clang"
# export BUILD_ARGS="--symlink-install ${CLANG_BASE} --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
# alias cb="colcon build ${BUILD_ARGS}"

if command -v register-python-argcomplete3 &> /dev/null; then
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
fi
if command -v register-python-argcomplete &> /dev/null; then
  eval "$(register-python-argcomplete ros2)"
  eval "$(register-python-argcomplete colcon)"
fi
