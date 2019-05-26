FROM arm32v7/python:3-slim
MAINTAINER Gregory Pocali <1571781+gpocali@users.noreply.github.com>

# This docker is used to receive authenticated muticast messages and say the contents of the message using text to speech

WORKDIR /usr/src/app

COPY notifyReceive ./
COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt
#pyotp

RUN apt-get update; apt-get -y install python-alsaaudio libav-tools espeak

# Install Pico2WAV
#RUN wget -o data.deb "https://mirrors.edge.kernel.org/debian/pool/non-free/s/svox/libttspico-data_1.0%2Bgit20130326-3_all.deb" && dpkg -i data.deb && rm data.deb
#RUN wget -o 0.deb "https://mirrors.edge.kernel.org/debian/pool/non-free/s/svox/libttspico0_1.0%2Bgit20130326-3_$(uname --m).deb" && dpkg -i 0.deb && rm 0.deb
#RUN wget -o utils.deb "https://mirrors.edge.kernel.org/debian/pool/non-free/s/svox/libttspico-utils_1.0%2Bgit20130326-3_$(uname --m).deb" && dpkg -i utils.deb && rm utils.deb

ENTRYPOINT ["python", "./notifyReceive", "start"]

