FROM ubuntu:16.04

MAINTAINER Anmol J. Hemrom <anmol.jh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y -q python-sphinx python-pip build-essential && \
    apt-get install -y -q texlive texlive-latex-extra pandoc && \
    pip install --upgrade pip && \
    pip install --upgrade virtualenv && \
    pip install sphinx_rtd_theme

RUN mkdir sphinx-docs
WORKDIR /sphinx-docs
VOLUME /sphinx-docs

CMD ["/bin/bash"]
