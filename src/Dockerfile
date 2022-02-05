FROM ubuntu:20.04
LABEL description="Tutorial Application"
ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY :0

# Make sure you can build docker image after you finished building debian intalling package
RUN if ! [ -f "tutorialpkg-0.1.1-Linux.deb" ]; then \
  echo "There is no installer package file. Do the following:\n" \
  echo "  cp ../build/tutorialpkg-0.1.1-Linux.deb ." \
  exit 1; \
fi

RUN apt update
RUN apt install -y gnupg gnupg2 gnupg1
RUN apt-key adv --fetch-keys https://repos.codelite.org/CodeLite.asc
RUN apt install -y software-properties-common

RUN export ARCH=$(dpkg --print-architecture); \
    if [ "$ARCH" = "amd64" ]; then apt-add-repository 'deb [arch=amd64] https://repos.codelite.org/wx3.1.5/ubuntu/ focal universe'; \
                              else apt-add-repository 'deb https://repos.codelite.org/wx3.1.5/ubuntu/ focal universe'; \
    fi

RUN apt update
RUN apt install -y libwxbase3.1-0-unofficial libwxbase3.1unofficial-dev libwxgtk3.1-0-unofficial libwxgtk3.1unofficial-dev wx3.1-headers wx-common libwxgtk-media3.1-0-unofficial
RUN apt install -y libwxgtk-media3.1unofficial-dev libwxgtk-webview3.1-0-unofficial libwxgtk-webview3.1unofficial-dev libwxgtk-webview3.1-0-unofficial-dbg libwxbase3.1-0-unofficial-dbg
RUN apt install -y libwxgtk3.1-0-unofficial-dbg libwxgtk-media3.1-0-unofficial-dbg wx3.1-i18n wx3.1-examples
RUN apt install -y libgtk-3-0 libsm6 libxext6 libxrender-dev libnotify-dev
RUN apt install -qqy x11-apps
RUN apt update
RUN mkdir -p /opt
COPY tutorialpkg-0.1.1-Linux.deb /opt
RUN dpkg -i /opt/tutorialpkg-0.1.1-Linux.deb

CMD tutorial

# Build the docker image like this:
#   docker build -t tutorial:0.1 .

# Once the image is created, test tutorial like this:
#   xhost +local:
#   XSOCK=/tmp/.X11-unix
#   docker run -v $XSOCK:$XSOCK tutorial:0.1

