FROM centos:7

MAINTAINER isergey87 <isergey87@gmail.com>

RUN yum update -y && \
yum install -y libfaketime && \
curl -C - -LR#OH "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.rpm" && \
yum localinstall -y jdk-9.0.4_linux-x64_bin.rpm && \
rm -f jdk-9.0.4_linux-x64_bin.rpm && \
yum clean all

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["/bin/sh", "-c", "export LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1 export FAKETIME_NO_CACHE=1 export DONT_FAKE_MONOTONIC=1]
CMD ["bash"]
