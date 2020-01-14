# Makefile to build TeX Live Docker containers for historical versions.

# Mirror to use for historical archive
# More mirrors: https://www.tug.org/historic/
HISTORIC_ARCHIVE_MIRROR = http://ftp.math.utah.edu/pub/tex/historic/
#HISTORIC_ARCHIVE_MIRROR = https://ftp.tu-chemnitz.de/pub/tug/historic/

.PHONY: all
all: 2019 2018 2017 2016 2015 2014

.PHONY: 2019
2019:
	docker build -t texlive:2019 -t texlive:latest .

.PHONY: 2018
2018:
	docker build --build-arg BASE_REPOSITORY=$(HISTORIC_ARCHIVE_MIRROR)/systems/texlive/2018/ --build-arg REPOSITORY_SUFFIX=tlnet-final/ --build-arg VERSION=2018 -t texlive:2018 .

.PHONY: 2017
2017:
	docker build --build-arg BASE_REPOSITORY=$(HISTORIC_ARCHIVE_MIRROR)/systems/texlive/2017/ --build-arg REPOSITORY_SUFFIX=tlnet-final/ --build-arg VERSION=2017 -t texlive:2017 .

.PHONY: 2016
2016:
	docker build --build-arg BASE_REPOSITORY=$(HISTORIC_ARCHIVE_MIRROR)/systems/texlive/2016/ --build-arg REPOSITORY_SUFFIX=tlnet-final/ --build-arg VERSION=2016 -t texlive:2016 .

.PHONY: 2015
2015:
	docker build --build-arg BASE_REPOSITORY=$(HISTORIC_ARCHIVE_MIRROR)/systems/texlive/2015/ --build-arg REPOSITORY_SUFFIX=tlnet-final/ --build-arg VERSION=2015 -t texlive:2015 .

.PHONY: 2014
2014:
	docker build --build-arg BASE_REPOSITORY=$(HISTORIC_ARCHIVE_MIRROR)/systems/texlive/2014/ --build-arg REPOSITORY_SUFFIX=tlnet-final/ --build-arg INSTALL_TAR=tlnet-final/install-tl-unx.tar.gz --build-arg VERSION=2014 -t texlive:2014 .

.PHONY: 2013
2013:
	docker build --build-arg BASE_REPOSITORY=$(HISTORIC_ARCHIVE_MIRROR)/systems/texlive/2013/ --build-arg REPOSITORY_SUFFIX=tlnet-final/ --build-arg INSTALL_TAR=tlnet-final/install-tl-unx.tar.gz --build-arg VERSION=2013 -t texlive:2013 .
