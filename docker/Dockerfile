FROM ubuntu:24.04
RUN apt-get update && apt-get install -y sudo bash passwd locales curl wget git
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN useradd -m -s /bin/bash hehe
RUN echo "hehe:hehe" | chpasswd
RUN usermod -aG sudo hehe
RUN echo "hehe ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER hehe
WORKDIR /home/hehe
CMD ["/bin/bash"]
