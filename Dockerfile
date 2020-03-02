FROM adoptopenjdk/openjdk11:latest

WORKDIR /opt/Firmware

RUN apt-get update
RUN apt-get install -y git gcc g++ cmake make ant
RUN apt-get install -y python-pip python-setuptools
RUN pip install toml pyyaml numpy empy jinja2

COPY . .
RUN make
RUN ant -buildfile Tools/jMAVSim/build.xml create_run_jar

EXPOSE  4560/tcp
EXPOSE 14540/tcp
EXPOSE 14580/tcp
EXPOSE 14550/tcp

ENV HEADLESS 1
ENV PX4_HOME_ALT 0
ENV PX4_HOME_LAT -35.363263
ENV PX4_HOME_LON 149.165238
ENV PX4_HOME_ADDR 192.168.1.219
ENV PX4_GNDCTRL_PORT 14550

##
#  Run with default staging configuration:
#      docker container run --tty px4:1.0
#
#  Run with custom configuration:
#      docker container run --tty --env PX4_HOME_ADDR='192.168.1.156' px4:1.0
##

CMD [ "make", "px4_sitl_default", "jmavsim" ]
