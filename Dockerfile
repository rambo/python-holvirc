FROM ubuntu:18.04
ENV PYTHONUNBUFFERED 1
ENV DEBIAN_FRONTEND noninteractive

# Usual update / upgrade
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y software-properties-common sudo curl \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Python stuff
RUN apt-get update \
    && apt-get install -y build-essential \
    git python-dev python3-dev python-virtualenv \
    python3-pip python-pip python3-selenium chromium-chromedriver xvfb \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

# Working directory
COPY . /opt/python-holvirc
WORKDIR /opt/python-holvirc

RUN cd /opt/python-holvirc \
    && chmod a+x /opt/python-holvirc/docker/docker-entrypoint.sh \
    && virtualenv --system-site-packages -p `which python3` ../holvirc-venv \
    && . ../holvirc-venv/bin/activate \
    && pip install pip --upgrade \
    && pip install packaging appdirs urllib3[secure] \
    && pip install -r devel_requirements.txt \
    && pip install -e .

ENTRYPOINT ["/opt/python-holvirc/docker/docker-entrypoint.sh"]
