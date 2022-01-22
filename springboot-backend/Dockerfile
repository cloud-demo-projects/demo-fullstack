FROM openjdk:11-jre-slim

MAINTAINER Nipun Bahri

LABEL Environment="Development"

WORKDIR /usr/local/lib

COPY . .

EXPOSE 8080

ENTRYPOINT ["java","-jar","/usr/local/lib/target/springboot-backend-0.0.1-SNAPSHOT.jar"]


