#!/usr/bin/env bash

docker run -it -v ~/.m2:/home/developer/.m2 \
               -v ~/.gradle:/home/developer/.gradle \
               -v ~/.grails:/home/developer/.grails \
               -v ~/.ssh/:/home/developer/.ssh \
               -v ~/git/:/home/developer/git \
               -v ~/.git/:/home/developer/.git \
               vaidegrails/grails:3.2.8-alpine \
               /bin/bash