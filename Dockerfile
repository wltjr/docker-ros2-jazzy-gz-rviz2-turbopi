FROM unfrobotics/docker-ros2-jazzy-gz-rviz2:latest

# dark theme
COPY gz/sim/8/gui.config /root/.gz/sim/8/gui.config
COPY qt5ct/qt5ct.conf /root/.config/qt5ct/qt5ct.conf
COPY qt5ct/colors/Dracula.conf /root/.config/qt5ct/colors/Dracula.conf

# add to .bashrc and .bash_history
COPY commands.sh ./commands.sh

RUN chmod +x ./commands.sh && sync && ./commands.sh
