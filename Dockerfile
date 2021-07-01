########################################################################
# Based on the official TeamCity Agent image with Nodejs added on top. #
########################################################################

FROM jetbrains/teamcity-agent:latest

USER root
ARG BUILD_DATE
ARG VCS_REF

MAINTAINER karavan
LABEL maintainer="karavan"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/karavan/teamcity-agent-nodejs_v10"
LABEL org.label-schema.vcs-ref=$VCS_REF

RUN apt-get update && \
	apt-get install -y build-essential postgresql-client && \
	curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
	apt-get install -y nodejs && \
	apt-get install -y sudo && \
	apt-get clean all && \
	npm i -g npm@6.13.4 less@3.10.3 less-plugin-autoprefix@2.0.0 less-plugin-clean-css@1.5.1

COPY docker_opts.sh /services/docker_opts.sh
USER buildagent
