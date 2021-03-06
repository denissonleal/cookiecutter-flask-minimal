FROM python:3.8-slim-buster

ENV PATH ${PATH}:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /app

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y apt-utils

RUN apt-get install -y gnupg \
  build-essential

RUN pip install setuptools wheel cython

COPY requirements.txt requirements_dev.txt ./

RUN pip install -r requirements.txt -r requirements_dev.txt

CMD python {{cookiecutter.package_name}}/api.py
