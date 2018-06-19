FROM debian:8

ENV DEBIAN_FRONTEND noninteractive  

RUN apt-get update &&\
    apt-get install -y --force-yes \
    unzip \
    apt-transport-https \
    sudo \
    curl \
    wget \
    libgtk2.0-0 \
    libgconf2-4 \
    libnss3 \
    libasound2 \
    libxtst6 \
    libcanberra-gtk-module \
    libgl1-mesa-glx \
    libxss1 &&\
    rm -rf /var/lib/apt/lists/*
  
  
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg &&\
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg &&\
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get update &&\
    apt-get install -y code &&\
    apt-get install -f

RUN cp /usr/lib/x86_64-linux-gnu/libxcb.so.1 /usr/share/code/ &&\
    cp /usr/lib/x86_64-linux-gnu/libxcb.so.1.1.0 /usr/share/code/ &&\
    sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1 &&\
    sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/share/code/libxcb.so.1.1.0

RUN mkdir /data

ENTRYPOINT /usr/bin/code --user-data-dir=/data --verbose 
