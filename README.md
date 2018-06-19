# Docker on Windows - Visual Code over Xming

Run Visual Studio Code, from a Docker container based on Debian 8 hosted on Windows and powered by Xming (a Windows X11 server).

### keywords
Docker, Dockerfile, Docker Hub, linux, Xming, X11 server



### Description
Traditionally we see container running applications on the server side, leaving it's presentation layer to typically a browse or, to interacte with the container via a command prompt. However, it's also possible to run a container and use a X11 server to access a GUI. In this example, I'll explain how to run a container on a Windows environment to use Visual Studio Code.



### Prerequisites

##### Docker Image
A Docker Image available on Docker Hub:

* [Visual-Studio-Code-on-Docker](/docker-hub/samueldossantos/docker-vscode) 

##### Windows X11 server

* Xming

### Configuration
1. Configure Xming X Server `x0.hosts` file with your ip address (e.g.:)
```
localhost
192.168.1.7	
```

Note: default location is `c:\Program Files (x86)\Xming\x0.hosts`

### Instructions for use on Windows

1. Make sure Xming is install and configured
 
2. Open a PowerShell command prompt.

3. Set the DISPLAY environment variable (make sure to replace `<localhost>`
 with you own settings)
```
    PS> set-variable -name DISPLAY -value <localhost>:0.0
```

4. Run a Docker image in interactive mode (replace `<docker_image>` with the designated image or with your own):
```
    PS> docker run -it --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <docker_image>
```


