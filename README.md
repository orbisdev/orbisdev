# orbisdev
Main PS4 Repo for building the whole `Orbis Development` environment in your local machine.

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/orbisdev/orbisdev/CI?label=CI&logo=github&style=for-the-badge)](https://github.com/orbisdev/orbisdev/actions?query=workflow%3ACI)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/orbisdev/orbisdev/CI-Docker?label=CI-Docker&logo=github&style=for-the-badge)](https://github.com/orbisdev/orbisdev/actions?query=workflow%3ACI-Docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/orbisdev/orbisdev?style=for-the-badge)](https://hub.docker.com/r/orbisdev/orbisdev/tags)

This program will automatically build and install the whole a compiler and other tools used in the creation of homebrew software for the Sony PlayStation® 4 videogame system.

## What these scripts do

These scripts download (`git clone`) and install: 
- [orbisdev-toolchain](https://github.com/orbisdev/orbisdev-toolchain "orbisdev-toolchain") 
- [orbisdev-sdkvanilla](https://github.com/orbisdev/orbisdev-sdkvanilla "orbisdev-sdkvanilla") 
- [orbisdev-liborbis](https://github.com/orbisdev/orbisdev-liborbis "orbisdev-liborbis") 
- [orbisdev-raylib](https://github.com/orbisdev/orbisdev-raylib "orbisdev-raylib")
- [lief](https://github.com/orbisdev/lief "lief")
- [pkgtool](https://github.com/maxton/LibOrbisPkg "pkgtool")
- [gp4gen](https://github.com/orbisdev/orbisdev-gp4gen "orbisdev-gp4gen")

## Requirements

1. Install clang, make, patch, git, texinfo wget, bison, flex, dotnet (3.1) and m4 if you don't have those.

2. Add this to your login script (example: ~/.bash_profile)  
```
export ORBISDEV=/usr/local/orbisdev
export PATH=$ORBISDEV/bin:$PATH
#change to your nfs root path
export SELF_PATH_INSTALL=/usr/local/orbisdev/git/ps4sh/bin/hostapp
#change to your server ip 
export DEBUGNET_PC_IP=192.168.1.12
```

3. Run build-all.sh  
```
./build-all.sh
```

## Docker generation
This repo also uses CI/CD to create a docker image called `orbisdev/orbisdev:latest`per change. This is quite useful if you're a developer that want to create/port an application to the PS4. So, you just can go there and compile your project using this docker image.

## Extra steps
If you want, you *JUST* can install the extra tools for generating pkg, to achieve this just execute

```
./build-extra.sh
```

## HELP
How to install the specific version of the dotnet 3.1 in : 
- OSX: [homebrew-dotnet-sdk-versions](https://github.com/isen-ng/homebrew-dotnet-sdk-versions "homebrew-dotnet-sdk-versions")
- Ubuntu: [dotnet](https://docs.microsoft.com/es-es/dotnet/core/install/linux-ubuntu "dotnet")
- From source code: 
```bash
wget https://dot.net/v1/dotnet-install.sh && chmod 755 dotnet-install.sh && ./dotnet-install.sh -c Current --install-dir ~/cli
```
## Thanks
