# WinboxLauncher
A Docker container that contains all major version of WinBox eliminating compatibility issues with RouterOS.
```
docker pull ghcr.io/ice-wzl/winbox_launcher:latest
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix winbox_launcher

# OR
git clone https://github.com/ice-wzl/WinboxLauncher.git
docker build -t winbox_launcher winbox_launcher
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix winbox_launcher
```
