FROM openjdk:11.0-jdk-slim

ENV DB_USER DB_PASS

ARG SPRING_PROFILE="dev"
ARG DESCRIPTION="springboot-backend"
ARG VERSION=$VERSION
ARG BUILD_URL=$BUILD_URL
ARG BUILD_DATE=$BUILD_DATE
ARG VCS_URL=$VCS_URL
ARG VCS_REF=$VCS_REF

############################ Mandatory Labels For Tracing & Visibility ####################
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

############################ Disable root user ####################
# add the appuser group with a group id of 1001 (does not exist on the host)
RUN addgroup --system --gid 1001 appuser
# add the appuser user with user id of 1001 (does not exist on the host)
# add the appuser user to the appuser group
RUN adduser --system --uid 1001 --ingroup appuser appuser
# make sure login is done via appuser not via root
USER appuser
############################ End: Disable root user ####################

COPY target/springboot-backend-1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar","--spring.profiles.active=${SPRING_PROFILE}","--db.user=${DB_USER}", "--db.pass=${DB_PASS}"]


