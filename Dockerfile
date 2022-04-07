FROM nginx:stable

WORKDIR /opt

RUN apt-get update && apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && dpkg -r --force-all apt apt-get && dpkg -r --force-all debconf dpkg

RUN pip3 install sigal

COPY run.sh sigal.conf.py auth.conf auth.htpasswd ./

ENV LANG C.UTF-8

CMD ["./run.sh"]
