FROM ubuntu:16.04

MAINTAINER Anmol J. Hemrom <anmol.jh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y -q python-sphinx python-pip build-essential && \
    apt-get install -y -q texlive texlive-latex-extra pandoc && \
    apt-get install -y -q git vim tree && \
    pip install --upgrade pip && \
    pip install --upgrade virtualenv && \
    pip install sphinx_rtd_theme    
RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 -m ubuntu
RUN mkdir /sphinx-docs && chown ubuntu:ubuntu /sphinx-docs

USER ubuntu
WORKDIR /sphinx-docs
VOLUME /sphinx-docs

CMD ["/bin/bash"]
