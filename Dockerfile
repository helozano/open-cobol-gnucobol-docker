FROM ubuntu

ARG OC_VERSION=2.2
ARG BASE_URL=http://ftp.gnu.org/gnu/gnucobol/gnucobol-${OC_VERSION}.tar.gz

ADD ${BASE_URL} oc.tar.gz
RUN apt-get update \
    && apt-get install build-essential make libgmp3-dev libdb-dev git -y

RUN tar -xvf oc.tar.gz &&\
    cd gnucobol-2.2 &&\
    ./configure --prefix=/usr/ &&\
    make install &&\
    
CMD ["cobc"]
