FROM registry.fedoraproject.org/fedora:34



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

# COPY dnsperf-2.6.0.tar.gz /root/
RUN curl https://www.dns-oarc.net/files/dnsperf/dnsperf-2.6.0.tar.gz -o /root/dnsperf-2.6.0.tar.gz
COPY queries.txt /root/
WORKDIR /root
RUN tar -xzvf dnsperf-2.6.0.tar.gz

WORKDIR /root/dnsperf-2.6.0
# ENV CONFIG_SHELL=/bin/bash
RUN ./configure
RUN make
RUN make install

RUN mkdir /root/dnsout
WORKDIR /root/dnsout