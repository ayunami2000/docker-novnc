FROM debian:buster

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get upgrade; \
    apt-get install -y \
      bash \
      fluxbox \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      xvfb \
      sudo \
      curl \
      jq \
      snapd \
      openjdk-11-jdk;
    
      

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes
COPY . /app

CMD ["/app/entrypoint.sh"]
EXPOSE 8080

RUN set -ex; \
    apt-get install -y anbox-modules-dkms android-tools-adb; \
    modprobe ashmem_linux; \
    modprobe binder_linux; \
    wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/4.1.1.0/android-studio-ide-201.6953283-linux.tar.gz; \
    tar -xf android-studio-ide-201.6953283-linux.tar.gz; \
    cd android-studio/bin; \
    ./studio.sh; \
    adb start-server; \
    wget -O app.apk `curl -s 'http://ws75.aptoide.com/api/7/apps/search/query=com.innersloth.spacemafia/limit=1' | jq -r ".datalist.list[0].file.path"`; \
    adb install app.apk; \
    anbox;
