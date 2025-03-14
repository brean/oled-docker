ARG ROS_DISTRO=humble
FROM ros:${ROS_DISTRO}-ros-base

ENV COLCON_WS=/root/colcon_ws
ENV COLCON_WS_SRC=/root/colcon_ws/src

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

# install dependencies
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    python3-luma.oled \
    python3-pil \
    python3-pip \
    libraspberrypi-bin \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install vcgencmd

WORKDIR /app/oled_screen

COPY src/*.py /app/oled_screen/

CMD ["python3", "sys_info_extended.py"]