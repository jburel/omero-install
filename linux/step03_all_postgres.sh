#!/bin/bash

if [[ "$PGVER" =~ ^(pg94|pg95)$ ]]; then

    source settings.env

    #start-setup

    echo "CREATE USER $OMERO_DB_USER PASSWORD '$OMERO_DB_PASS'" | \
        su - postgres -c psql
    su - postgres -c "createdb -E UTF8 -O '$OMERO_DB_USER' '$OMERO_DB_NAME'"

    psql -P pager=off -h localhost -U "$OMERO_DB_USER" -l

fi