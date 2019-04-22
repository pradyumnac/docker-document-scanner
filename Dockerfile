FROM python:3.7-slim

MAINTAINER Pradyumna <pady92@gmail.com>

# RUN adduser scanuser
# RUN useradd -ms /bin/bash  scanuser

WORKDIR /home/scanuser

RUN apt-get update && \
            apt-get install -y \
            libglib2.0-0 \
            libsm6 \
            libxext6 \
            libxrender1 \
            libfontconfig1 \
            libxrender-dev \
            libswscale-dev \
            libtbb2 \
            libtbb-dev \
            libjpeg-dev \
            libpng-dev \
            libtiff-dev \
            libavformat-dev \
            libpq-dev


COPY requirements.txt requirements.txt
RUN python -m venv venv

RUN venv/bin/pip install --upgrade pip
RUN venv/bin/pip install -r requirements.txt
# RUN venv/bin/pip install gunicorn

COPY code code
COPY boot.sh boot.sh
RUN chmod a+x boot.sh

RUN mkdir temp
RUN mkdir uploadfile

ENV FLASK_APP code/web.py

# RUN chown -R scanuser:scanuser ./
# USER scanuser

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]