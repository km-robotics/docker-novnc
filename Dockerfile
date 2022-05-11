FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      fluxbox \
      git \
      net-tools \
      nginx \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      xvfb

# Setup demo environment variables
ENV HOME=/root \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=no \
    RUN_FLUXBOX=yes

# graphic drivers for testing GPU capabilities inside Docker containers on non-NVIDIA hardware
RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:oibaf/graphics-drivers -y \
    && apt install -y mesa-utils \
    && apt upgrade -y \
    && rm -rf /var/lib/apt/lists/

COPY . /app
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
COPY index.htm /usr/share/novnc/

CMD ["/app/entrypoint.sh"]

EXPOSE 8080
EXPOSE 5900
