#Docker on Windows - Visual Code over Xming

----
keywords: Docker, Dockerfile, Docker Hub, linux, Xming, X11 server
----


##Description
Dockerfile to generate a Docker image based on Debian, to run Visual Code. Then, use Xming, a Windows X11 server, to run an instance of Visual Code running from a Docker container. 





### Pre-requisits

##### Docker Image
A Docker Image is available to download from Docker Hub

* [Image Repositories](/docker-hub/samueldossantos/docker-vscode): Visual Code on Linux 

##### Windows X11 server

* Xming


## Instructions for use on Windows
Install and configure Xming
Run [docker-vscode](/docker-hub/samueldossantos/docker-vscode) in interactive mode.

This is one aproach to run Visual Studio Code, from a docker image on Windows.



##### Configuration
1. Configure Xming X Server `x0.hosts` file with your ip address (e.g.:)
```
localhost
192.168.1.7	
```

Note: default location is `c:\Program Files (x86)\Xming\x0.hosts`

##### Docker image run
1. Open a PowerShell command prompt.
2. Set the DISPLAY environment variable (make sure to replace `<localhost>`
 with you own settings)
```
    PS> set-variable -name DISPLAY -value <localhost>:0.0
```

3. Run the docker image (make sure to replace `<docker_image>` with your docker image):
```
    PS> docker run -it --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix <docker_image>
```


