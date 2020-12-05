# AnBox noVNC Display Container
```
```
This image is intended to be used for displaying android applications in a browser.

## Image Contents

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/) - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [xterm](http://invisible-island.net/xterm/) - to demo that it works
* [supervisord](http://supervisord.org) - to keep it all running
* also anbox setup stuff

## Usage

### AnBox
Run:
```bash
$ docker run --rm -it -p 8080:8080 ayunami2000/anbox-novnc
```
Open a browser and see the **android setup utility after a short wait** at `http://<server>:8080/vnc.html`

## This is a fork of this, on DockerHub / GitHub
___
* DockerHub [theasp/novnc](https://hub.docker.com/r/theasp/novnc/)
* GitHub [theasp/docker/novnc](https://github.com/theasp/docker-novnc)

# Thanks
___
This is based on the alpine container by @psharkey: https://github.com/psharkey/docker/tree/master/novnc
Based on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker) and [octave-x11-novnc-docker](https://hub.docker.com/r/epflsti/octave-x11-novnc-docker/).
Based on [this](https://github.com/theasp/docker-novnc)
based
