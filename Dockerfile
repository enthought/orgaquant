##### BASE IMAGE #####
FROM continuumio/miniconda3:4.6.14

## Install system resources & dependencies
RUN apt-get update \
  && apt-get install -y gcc git libglib2.0-0 libsm6 libxrender1

## Set up environment
RUN conda create -n orgaquant python=3.6
RUN activate orgaquant

## Install prerequisites
RUN conda install tensorflow-gpu=1.14 git
RUN pip install keras-resnet==0.2.0 cython keras matplotlib opencv-python progressbar2 streamlit

## Get repo into app directory
RUN git clone https://github.com/TKassis/OrgaQuant.git
ADD orgaquant-1-cwl.py OrgaQuant/

## Install/build Keras
WORKDIR OrgaQuant
RUN python setup.py build_ext --inplace
