FROM registry.fedoraproject.org/fedora:34

# dnsperf dependencies
RUN dnf install -y \
    dnf-plugins-core \
    ck-devel \
    openssl-devel \
    python \
    python-pip && \
  dnf copr enable -y @dnsoarc/dnsperf && \
  dnf install dnsperf -y

# my network utilities
RUN dnf install -y \
    bind-utils \ 
    iperf3 \
    uperf


  
  