ros2 launch turbopi_ros gamepad.launch.py
ros2 launch turbopi_ros ign_gazebo.launch.py custom:=False world:=playground
ros2 launch turbopi_ros ign_gazebo.launch.py
ros2 launch turbopi_ros nav2.launch.py
rviz2 -d src/turbopi_ros/config/turbopi.rviz
rm -r build; colcon build --symlink-install --packages-select  turbopi_ros
