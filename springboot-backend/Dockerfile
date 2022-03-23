FROM openjdk:11.0-oraclelinux8

LABEL Maintainer="Nipun Bahri"
LABEL Environment="Development"

WORKDIR /usr/local/lib

COPY . .

EXPOSE 8080

ENTRYPOINT ["java","-jar","/usr/local/lib/target/springboot-backend-0.0.1-SNAPSHOT.jar"]


