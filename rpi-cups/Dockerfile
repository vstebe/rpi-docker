FROM resin/rpi-raspbian:jessie

# Install Packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
# Install basic tools and cups
RUN apt-get install -y sudo locales whois cups cups-client cups-bsd
# Install all drivers
RUN apt-get install -y printer-driver-all printer-driver-gutenprint

RUN apt-get install -y vim

RUN apt-get install -y samba

ENV DEBIAN_FRONTEND ""

# Setup UTF-8 locale
RUN sed -i "s/^#\ \+\(en_US.UTF-8\)/\1/" /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

# Add user
RUN useradd \
  --groups=sudo,lp,lpadmin \
  --create-home \
  --home-dir=/home/print \
  --shell=/bin/bash \
  --password=$(mkpasswd print) \
  print
# Disable sudo password checking for users of the sudo group
RUN sed -i '/%sudo[[:space:]]/ s/ALL[[:space:]]*$/NOPASSWD:ALL/' /etc/sudoers

# Clean image
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* && mkdir /var/lib/apt/lists/partial

# Setup environment
WORKDIR /home/print

# Default shell
CMD ["/usr/sbin/cupsd", "-f"]
