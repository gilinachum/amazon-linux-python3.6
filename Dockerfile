FROM amazonlinux:latest

ENV PYSHORT 3.6
ENV PYTHONVER 3.6.3
ENV MD5CHECKSUM 2d0fc9f3a5940707590e07f03ecb08b9

WORKDIR /tmp

RUN yum -y install wget

RUN wget --no-check-certificate https://www.python.org/ftp/python/${PYTHONVER}/Python-${PYTHONVER}.tgz
RUN tar -zxvf Python-${PYTHONVER}.tgz

WORKDIR /tmp/Python-${PYTHONVER}
RUN ./configure --prefix=/usr/local LDFLAGS="-Wl,-rpath /usr/local/lib" --with-ensurepip=install
RUN make && make altinstall
RUN pip3.6 install virtualenv

WORKDIR /root
RUN rm -r /tmp/Python-${PYTHONVER}
