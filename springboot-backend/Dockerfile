FROM adoptopenjdk/openjdk11
COPY target/springboot-backend-0.0.1-SNAPSHOT.jar springboot-backend-1.0.0.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/springboot-backend-1.0.0.jar"]

#
# Build stage
#
#FROM maven:3.6.0-jdk-11-slim AS build
#COPY src /home/app/src
#COPY pom.xml /home/app
#RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
#FROM openjdk:11-jre-slim
#COPY --from=build /home/app/target/springboot-backend-0.0.1-SNAPSHOT.jar /usr/local/lib/springboot-backend.jar
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]