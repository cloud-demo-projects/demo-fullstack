FROM adoptopenjdk/openjdk11:slim

ENV DB_USER DB_PASS

ARG DESCRIPTION="springboot-backend"
ARG VERSION=$VERSION
ARG BUILD_URL=$BUILD_URL
ARG BUILD_DATE=$BUILD_DATE
ARG VCS_URL=$VCS_URL
ARG VCS_REF=$VCS_REF

LABEL com.abnamro.label-schema.maintainer="Nipun Bahri"
LABEL com.abnamro.label-schema.schema-version="0.1"
LABEL org.label-schema.build-date=${BUILD_DATE}
LABEL org.label-schema.name="springboot-backend"
LABEL org.label-schema.description=${DESCRIPTION}
LABEL org.label-schema.usage=""
LABEL org.label-schema.url=""
LABEL org.label-schema.vcs-url=${VCS_URL}
LABEL org.label-schema.vcs-ref=${VCS_REF}
LABEL org.label-schema.vendor="Cloud Demo"
LABEL org.label-schema.version=${VERSION}
LABEL org.label-schema.schema-version="1.0"

RUN adduser --system java -h /home/java -u 678

USER 678

WORKDIR /home/java

ENV APPLICATIONINSIGHTS_CONNECTION_STRING="InstrumentationKey=72a5274a-08a8-4d4d-b24d-7f13f501906d"
COPY applicationinsights-agent-3.0.3.jar applicationinsights-agent.jar

COPY target/springboot-backend-1.0.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-javaagent:/home/java/applicationinsights-agent.jar","-jar","/app.jar","--spring.profiles.active=${SPRING_PROFILE}","--db.user=${DB_USER}", "--db.pass=${DB_PASS}"]
