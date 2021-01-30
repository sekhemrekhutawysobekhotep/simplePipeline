
FROM ubuntu:latest

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y  

COPY .bashrc /root/
COPY theAnswerIs.sh /root/

CMD ["/bin/bash"]


# ... save this file as Dockerfile then in same dir issue following
#
# docker build --tag stens_ubuntu .   # creates image stens_ubuntu
#
# docker run -d  stens_ubuntu  sleep infinity # launches container 
#
# docker ps     #   show running containers
#
# 
# ... find CONTAINER ID from above and put into something like this
#
# docker exec -ti $( docker ps | grep stens_ubuntu | cut -d' ' -f1 ) bash   #  login to running container
# docker exec -ti 3cea1993ed28 bash   #  login to running container using sample containerId  
#

