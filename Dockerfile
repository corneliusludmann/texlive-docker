FROM debian:testing

ARG BASE_REPOSITORY=http://ftp.math.utah.edu/pub/tex-archive/systems/texlive/tlnet/
#ARG BASE_REPOSITORY=https://mirror.informatik.hs-fulda.de/tex-archive/systems/texlive/tlnet/
ARG INSTALL_TAR=install-tl-unx.tar.gz
ARG REPOSITORY_SUFFIX
ARG VERSION=2019
ARG PROFILE=${VERSION}/texlive.profile

RUN apt-get update && \
	apt-get install -y \
		perl \
		wget \
	&& apt-get clean -y && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

COPY $PROFILE /texlive.profile
RUN wget ${BASE_REPOSITORY}/${INSTALL_TAR} \
	&& tar -xzf install-tl-unx.tar.gz \
	&& ./install-tl-*/install-tl -repository ${BASE_REPOSITORY}/${REPOSITORY_SUFFIX} -profile /texlive.profile \
	&& rm -rf install-tl-*\
	&& rm -rf $(grep TEXDIR texlive.profile | cut -f2 -d' ')/texmf-dist/doc \
	&& rm -rf $(grep TEXDIR texlive.profile | cut -f2 -d' ')/texmf-dist/source \
	&& rm texlive.profile

ENV PATH="/usr/local/texlive/${VERSION}/bin/x86_64-linux:${PATH}"
