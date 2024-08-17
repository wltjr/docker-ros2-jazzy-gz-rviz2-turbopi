FROM unfrobotics/docker-ros2-jazzy-gz-rviz2:latest

# dark theme
COPY gz/sim/8/gui.config /root/.gz/sim/8/gui.config
COPY qt5ct/qt5ct.conf /root/.config/qt5ct/qt5ct.conf
COPY qt5ct/colors/Dracula.conf /root/.config/qt5ct/colors/Dracula.conf

RUN echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> /root/.bashrc

# media/resource paths for Gazebo
RUN echo 'export GAZEBO_MODEL_PATH=/opt/ros_ws/src/turbopi_ros/worlds/models/:${GAZEBO_MODEL_PATH}' \
	>> /root/.bashrc
RUN echo 'export GZ_SIM_RESOURCE_PATH=${GAZEBO_MODEL_PATH}:${GZ_SIM_RESOURCE_PATH}' \
	>> /root/.bashrc

# common commands added to history
RUN echo "ros2 launch turbopi_ros gamepad.launch.py" \
        >> /root/.bash_history
RUN echo "rm -r build; colcon build --symlink-install --packages-select  turbopi_ros" \
        >> /root/.bash_history
RUN echo "rviz2 -d src/turbopi_ros/config/turbopi.rviz" \
	>> /root/.bash_history
RUN echo "ros2 launch turbopi_ros ign_gazebo.launch.py" \
	>> /root/.bash_history
