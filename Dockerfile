########################################################################
# Based on the official TeamCity Agent image with Nodejs added on top. #
########################################################################

FROM debian:stable-20210721

USER root
ARG BUILD_DATE
ARG VCS_REF

MAINTAINER karavan
LABEL maintainer="karavan"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/karavan/teamcity-agent-nodejs_v10"
LABEL org.label-schema.vcs-ref=$VCS_REF

RUN apt-get update && \
	apt-get install -y build-essential sudo wget && \
	curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
	apt-get install -y nodejs && \
	apt-get install -y postgresql-client && \
	apt-get clean all

COPY docker_opts.sh /services/docker_opts.sh
