#!/bin/sh

# common commands added to history
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> /root/.bashrc

# media/resource paths for Gazebo
echo 'export GAZEBO_MODEL_PATH=/opt/ros_ws/src/turbopi_ros/worlds/models/:${GAZEBO_MODEL_PATH}' \
	>> /root/.bashrc
echo 'export GZ_SIM_RESOURCE_PATH=${GAZEBO_MODEL_PATH}:${GZ_SIM_RESOURCE_PATH}' \
	>> /root/.bashrc

cat >> /root/.bash_history<< EOF
ros2 launch turbopi_ros gamepad.launch.py
ros2 launch turbopi_ros ign_gazebo.launch.py custom:=False world:=playground
ros2 launch turbopi_ros ign_gazebo.launch.py
ros2 launch turbopi_ros nav2.launch.py
rviz2 -d src/turbopi_ros/config/turbopi.rviz
rm -r build; colcon build --symlink-install --packages-select  turbopi_ros
EOF
