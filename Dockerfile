FROM centos:7

MAINTAINER isergey87 <isergey87@gmail.com>

RUN yum update -y && \
yum install -y epel-release && \
yum install -y libfaketime && \
curl -C - -LR#OH "Cookie: oraclelicense=accept-securebackup-cookie" -k "http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.rpm" && \
yum localinstall -y jdk-10.0.1_linux-x64_bin.rpm && \
rm -f jdk-10.0.1_linux-x64_bin.rpm && \
yum clean all

# Set environment variables.
ENV HOME /root
#ENV LD_PRELOAD /usr/lib64/faketime/libfaketime.so.1
#ENV FAKETIME_NO_CACHE 1
#ENV DONT_FAKE_MONOTONIC 1

# Define working directory.
WORKDIR /root

# Define default command.
#CMD ["/bin/sh", "-c", "export LD_PRELOAD=/usr/lib64/faketime/libfaketime.so.1 export FAKETIME_NO_CACHE=1 export DONT_FAKE_MONOTONIC=1]
CMD ["bash"]
