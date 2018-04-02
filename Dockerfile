FROM nvidia/cuda:8.0-cudnn5-runtime

MAINTAINER FingerNet <tangyao@pku.edu.cn>

RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        git \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python-dev \
        python-numpy \
        python-pip \
        software-properties-common \
        swig \
        zip \
        zlib1g-dev \
        libcurl3-dev \
        nano \
        htop \
        libxrender-dev \
        graphviz \
        libsm6 libxext6 \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install tensorflow-gpu==1.0.1 \
    keras==2.0.2 \
    opencv-python \
    matplotlib \
    pillow \
    h5py

RUN useradd -ms /bin/bash fingernet

COPY . /FingerNet
RUN chown -R fingernet:fingernet /FingerNet

USER fingernet
WORKDIR /FingerNet
