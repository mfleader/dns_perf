FROM registry.fedoraproject.org/fedora:34

# RUN curl https://www.dns-oarc.net/files/dnsperf/dnsperf-2.6.0.tar.gz

# my network utilities
RUN dnf install -y \
    iperf3 \
    # python \
    # python-pip \
    uperf \
    sysstat

# dnsperf, resperf dependencies
RUN dnf install -y \
    ck-devel \
    bind-utils \
    gcc \ 
    openssl-devel

COPY dnsperf-2.6.0.tar.gz /root/
COPY queries.txt /root/
WORKDIR /root
RUN tar -xzvf dnsperf-2.6.0.tar.gz

WORKDIR /root/dnsperf-2.6.0
RUN /bin/bash ./configure
RUN make
RUN make install

RUN mkdir /root/dnsout
WORKDIR /root/dnsout