ROM debian:stable

# Install git, supervisor, VNC, & X11 packages

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list

RUN set -ex; \
    apt update; \
    apt install -y \
      bash \
      fluxbox \
      git \
      novnc \
      socat \
      supervisor \
      x11vnc \
      xterm \
      xvfb \
      calibre \
      wget \
&& apt remove -y calibre \
&& apt -q -y clean

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin install_dir=/opt

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1280 \
    DISPLAY_HEIGHT=1024 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes \
    RUN_CALIBRE=yes
COPY *. /app
CMD ["/app/entrypoint.sh"]
VOLUME ["/mnt/Libraries"]
EXPOSE 8080 8081
