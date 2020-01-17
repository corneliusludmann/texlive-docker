[![Docker pulls](https://img.shields.io/docker/pulls/ludmann/latex-texlive.svg?maxAge=3600)](https://hub.docker.com/r/ludmann/latex-texlive/) [![Docker Stars](https://img.shields.io/docker/stars/ludmann/latex-texlive.svg?maxAge=3600)](https://hub.docker.com/r/ludmann/latex-texlive/) [![Docker layers](https://images.microbadger.com/badges/image/ludmann/latex-texlive.svg)](https://microbadger.com/images/ludmann/latex-texlive) ![License](https://img.shields.io/badge/License-MIT-blue.svg?maxAge=3600)

# LaTeX TeX Live Docker Images

## Supported tags and respective `Dockerfile` links
- [`2019`, `latest`](https://github.com/corneliusludmann/texlive-docker/blob/master/Dockerfile)
- [`2018`](https://github.com/corneliusludmann/texlive-docker/blob/master/Dockerfile)
- [`2017`](https://github.com/corneliusludmann/texlive-docker/blob/master/Dockerfile)

## What are the LaTeX TeX Live Docker Images?
This repository provides Docker images for all historical versions (currently 2017-2019, older versions are coming soon) of [TeX Live](https://www.tug.org/texlive/) from this archive: ftp://tug.org/historic/systems/texlive/

For all images the same Dockerfile based on `debian:testing` is used. The different versions are built with different [build args](https://docs.docker.com/engine/reference/commandline/build/#set-build-time-variables---build-arg). See the [Makefile](https://github.com/corneliusludmann/texlive-docker/blob/master/Makefile) for examples. There is a TeX Live profile file for each version, e.g. [2018/texlive.profile](https://github.com/corneliusludmann/texlive-docker/blob/master/2018/texlive.profile).

The motivation for providing historical TeX Live versions is that sometimes a new version breaks the LaTeX build (especially for poorly hacked LaTeX documents). With these images you could provide reliable builds by pinning to a specific version.

## How to use this image
Build your LaTeX document with `latexmk` like this (or with any other LaTeX tool provided by TeX Live):
```shell
$ docker run --rm --name texlive -v "$(pwd)":/workspace -w /workspace ludmann:latex-texlive latexmk -pdf
```

These images have no other user than `root`. If you need another user extend the image accordingly.

## Build Docker image locally
* Clone repository: `git clone https://github.com/corneliusludmann/texlive-docker.git`
* Run `make` to build all containers.
* Run e.g. `make 2018` to build only TeX Live 2018.

## License
The [repository](https://github.com/corneliusludmann/texlive-docker) is licensed under the [MIT License](https://github.com/corneliusludmann/texlive-docker/blob/master/LICENSE).
