# ################################
# Development build
# - image for development - requires the project and sources
# - set up a gcc capable environment with python scripting available
# ################################

ARG baseImage=python
ARG baseVersion=3.11.6-slim 
# SQLAlchemy fails to install on 3.12
FROM ${baseImage}:${baseVersion} as development
# make available in container (debug and versioning)
ARG baseImage=python
ARG baseVersion=3.11.6-slim

LABEL maintainer="sergiu.nagy"

WORKDIR /home/app

# prepare clang (better than gcc for ast extraction and data flow graphing)
RUN apt-get update && apt-get install build-essential -y && apt-get install clang -y
# prepare for gml and asz

COPY ./devenv/dependencies dependencies
RUN pip install --upgrade pip
RUN pip install -r dependencies