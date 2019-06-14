FROM ubuntu:16.04

MAINTAINER Anmol J. Hemrom <anmol.jh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y -q python-sphinx python-pip build-essential && \
    apt-get install -y -q texlive texlive-latex-extra pandoc && \
    apt-get install -y -q git vim tree && \
    pip install virtualenv && \
    pip install sphinx_rtd_theme


ARG USER_NAME=ubuntu
ARG USER_UID=1000
ARG USER_GID=1000
ARG SPHINX_DOCS_DIR=/opt/sphinx-docs

ENV SPHINX_DOCS_HOME ${SPHINX_DOCS_DIR}

RUN groupadd -r -g ${USER_GID} ${USER_NAME} && \
    useradd -r -g ${USER_NAME} -u ${USER_UID} -m ${USER_NAME}

RUN mkdir -p ${SPHINX_DOCS_HOME} && \
    chown -R ${USER_NAME}:${USER_NAME} ${SPHINX_DOCS_HOME}

COPY ./scripts/conf.py.patch /tmp/conf.py.patch
COPY ./scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENV SPHINX_PROJECT_NAME DemoProject
ENV SPHINX_AUTHOR_NAME  AH

USER ${USER_NAME}
WORKDIR ${SPHINX_DOCS_HOME}
VOLUME ${SPHINX_DOCS_HOME}

CMD ["/usr/local/bin/entrypoint.sh"]
