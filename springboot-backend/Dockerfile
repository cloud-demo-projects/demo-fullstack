FROM openjdk:11.0-jdk-oracle

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

# RUN addgroup --system --gid 1001 appuser \
# && adduser --system --uid 1001 --ingroup appuser appuser

# USER appuser

WORKDIR /

ENV APPLICATIONINSIGHTS_CONNECTION_STRING="InstrumentationKey=08a6c24c-87b5-4546-9e6e-893037832197;IngestionEndpoint=https://westeurope-5.in.applicationinsights.azure.com/;LiveEndpoint=https://westeurope.livediagnostics.monitor.azure.com/"
COPY applicationinsights-agent-3.2.11.jar applicationinsights-agent-3.2.11.jar
COPY target/springboot-backend-1.0.jar app.jar

EXPOSE 8443
ENTRYPOINT ["java","-javaagent:applicationinsights-agent-3.2.11.jar","-jar","app.jar","--spring.profiles.active=${SPRING_PROFILE}","--db.user=${DB_USER}", "--db.pass=${DB_PASS}"]
