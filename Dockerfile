FROM ubuntu:14.04
MAINTAINER Vai de Grails! <contact@vaidegrails.com>

### Default Grails version ###
ENV GRAILS_VERSION 3.2.8
ENV GRADLE_VERSION 3.4.1

### Auxilary programs ###
RUN apt-get update \
	&& apt-get install -y \
	curl \
	git \
	gitg \
	nano \
	software-properties-common \
	zip \
	unzip \
	&& rm -rf /var/lib/apt/lists/*

### OpenJDK 8 installation ###
RUN add-apt-repository ppa:openjdk-r/ppa -y \
	&& apt-get update \
	&& apt-get install -y openjdk-8-jdk \
	&& rm -rf /var/lib/apt/lists/*

### New user "develop" ###
RUN useradd -p "" -ms /bin/bash developer
ENV HOME /home/developer

USER developer

### Workdir definition ###
WORKDIR $HOME

###### Grails installation  ######
RUN curl -s get.sdkman.io | bash
RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh \
	&& sdk install grails $GRAILS_VERSION"

RUN /bin/bash -c "source $HOME/.sdkman/bin/sdkman-init.sh \
	&& sdk install gradle 3.4.1"

### Expose port 8080 (embedded Tomcat) and 5005 (debug) ###
EXPOSE 8080
EXPOSE 5005