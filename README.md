![GitHub Workflow Status](https://img.shields.io/github/workflow/status/impunitus/steamcmd/dockerhubci)![Docker Pulls](https://img.shields.io/docker/pulls/impunitus/steamcmd)![GitHub](https://img.shields.io/github/license/impunitus/steamcmd)
# steamcmd
```
Ubuntu Focal with steamcmd pre-installed for hosting game servers
```
## Overview

This is my randition of a base image for steamcmd. This is meant to be used as a base image for any server that needs steamcmd to run. Base image that this is built on top of is Ubuntu Focal.

### Info on steamcmd
* Valve Wiki - https://developer.valvesoftware.com/wiki/SteamCMD
* Command list - https://github.com/dgibbs64/SteamCMD-Commands-List.git

### Tags
* latest

## Usage
This image is meant to be used as a base for game servers requiring steamcmd. This image on its own does not serve much use other than to be inherited when building a container for your game server of choice. 

### Using as a base
To use this image as a base, use the below
```Dockerfile
FROM impunitus/steamcmd:latest
```
### Root/User Caveat

By default, this image runs as the `steam` user and does not have root access inside the container. This is due to the fact that `steamcmd` expects to be run as a user with the name `steam`. This also helps to mitigate any risks of running as root inside of the container.

If you need root during the build of your image, you can switch users during the build:
```Dockerfile
USER root

RUN your-root-script.sh

USER steam
```

If you need root access during the execution of the game server you will need to add the `steam` user to the root user group and make sure it can execute passwordless `sudo` commands. This in my experience is not necessary and is also not recommended or supported by myself.

### How to run
As mentioned previously, this container is not of much use on its own, and is meant to be inherited by containers or a specific game server. (IE Ark, Factorio, Valheim, etc)

If you still wish to run it on its own:
```bash
$ docker run -it impunitus/steamcmd bash
```

## Contributions 

Always welcome others to contribute to this with the understand that the sole purpose of this image is a base that runs steamcmd, nothing else. 
