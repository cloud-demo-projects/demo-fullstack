FROM openjdk:11.0-jdk-slim

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

RUN addgroup --system --gid 1001 appuser
RUN adduser --system --uid 1001 --ingroup appuser appuser

USER appuser

COPY target/springboot-backend-1.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]


