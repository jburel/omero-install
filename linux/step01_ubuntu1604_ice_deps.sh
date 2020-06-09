#!/bin/bash

ICEVER=${ICEVER:-ice36}

# Ice installation
if [ "$ICEVER" = "ice36" ]; then

    #start-recommended
    apt-get -y install software-properties-common
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 5E6DA83306132997
    apt-add-repository "deb http://zeroc.com/download/apt/ubuntu`lsb_release -rs` stable main"
    apt-get update
    apt-get -y install zeroc-ice-all-runtime
    #end-recommended
fi
