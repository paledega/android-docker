FROM debian
RUN apt update
RUN apt full-upgrade -y
RUN apt install bc bison build-essential ccache curl flex g++-multilib gcc-multilib \
    git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev \
    libelf-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev \
    libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc \
    zip zlib1g-dev rsync procps python3 -y
RUN ln -s python3 /usr/bin/python
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo
RUN chmod a+x /bin/repo
RUN git config --global user.email "you@example.com"
RUN  git config --global user.name "Your Name"
RUN echo "SELINUX_IGNORE_NEVERALLOWS = true" >> /root/.bashrc
RUN echo "USE_CCACHE=1" >> /root/.bashrc
RUN echo "export CCACHE_DIR=/usr/bin/ccache" >> /root/.bashrc
RUN ccache -M 50G
WORKDIR /root/
CMD /bin/bash
