#!/bin/bash

set -e -u -x

OMEROVER=${OMEROVER:-omero}
WEBAPPS=${WEBAPPS:-false}

source `dirname $0`/settings.env

bash -eux step01_centos7_init.sh

# install java
bash -eux step01_centos_java_deps.sh

# install ice
bash -eux step01_centos7_ice_deps.sh

bash -eux step01_centos7_deps.sh

# install Postgres
bash -eux step01_centos7_pg_deps.sh

bash -eux step02_all_setup.sh
bash -eux step03_all_postgres.sh

su - omero -c "source settings.env && bash -eux step04_all_$OMEROVER.sh"

bash -eux step05_centos7_nginx.sh

if [ $WEBAPPS = true ]; then
	bash -eux step05_1_all_webapps.sh
fi

#If you don't want to use the systemd scripts you can start OMERO manually:
#su - omero -c "OMERO.server/bin/omero admin start"
#su - omero -c "OMERO.server/bin/omero web start"

bash -eux setup_centos_selinux.sh

bash -eux step06_centos7_daemon.sh

#systemctl start omero.service
#systemctl start omero-web.service
