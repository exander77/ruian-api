FROM ubuntu:latest

RUN mkdir /project
WORKDIR /project
COPY . . 

CMD ["/project/run.sh"]
