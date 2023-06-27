FROM ubuntu:22.04 AS py3gdal
# install python 3.10
RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt update
RUN apt upgrade -y
RUN apt install -y python3.10
RUN apt install -y python3-pip

# install GDAL
RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable
RUN apt update
RUN apt install -y libgdal-dev gdal-bin libproj-dev libudunits2-dev libgeos-dev
RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal
RUN python3 -m pip install numpy  GDAL==$(gdal-config --version)
