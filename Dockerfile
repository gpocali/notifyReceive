FROM python:3-slim
MAINTAINER Gregory Pocali <1571781+gpocali@users.noreply.github.com>

# This docker is used to receive authenticated muticast messages and say the contents of the message using text to speech

WORKDIR /usr/src/app

COPY notifyReceive ./
COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
#pyotp

RUN sed -i '/^#.* non-free /s/^#//' /etc/apt/sources.list
RUN apt-get update; apt-get -y install python-alsaaudio libav-tools libttspico-utils

ENTRYPOINT ["python", "./notifyReceive", "start"]

