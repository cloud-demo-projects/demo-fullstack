FROM openjdk:11.0-oraclelinux8

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

##RUN as non root user RUN useradd --system java -m -u 888
#RUN adduser --system java -h /home/java/ -u 888
#USER 888

#RUN chmod 777 /var/log\
#	&& addgroup --system --gid 1000 mbr \ 
#    && adduser --system --uid 1000 --ingroup mbr mbr
#USER mbr

#RUN useradd -u 7979 gzesusr
#USER gzesusr

WORKDIR /usr/local/lib

COPY . .

EXPOSE 8080

ENTRYPOINT ["java","-jar","/usr/local/lib/target/springboot-backend-1.0.jar"]


