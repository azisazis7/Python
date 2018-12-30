FROM centos/python-35-centos7
LABEL MAINTAINER="ansible@localhost" VERSION="3" OS="Centos7"
USER root
RUN yum update -y && \
    yum groupinstall "development tools" -y && \
    yum install -y \
          libffi-devel \
          zlib-devel \
          bzip2-devel \
          openssl-devel \
          ncurses-devel \
          sqlite-devel \
          readline-devel \
          tk-devel \
          gdbm-devel \
          db4-devel \
          libpcap-devel \
          xz-devel \
          expat-devel \
          words \
          lsof \
          wget \
          vim-enhanced \
          which \
          curl && \
        git config --global user.name "AB" && git config --global user.email "ansible@localhost" && \
        curl https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/bashrc -o ~/.bashrc && \
        curl https://raw.githubusercontent.com/linuxacademy/content-python3-sysadmin/master/helpers/vimrc -o ~/.vimrc
CMD whoami
