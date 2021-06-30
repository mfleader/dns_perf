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
    bind-utils \
    gcc

COPY dnsperf-2.6.0.tar.gz /root/

RUN tar -xzvf dnsperf-2.6.0.tar.gz

RUN mkdir /root/dnsout
WORKDIR /root/dnsperf-2.6.0

RUN ./configure
RUN make
RUN make install





  
  