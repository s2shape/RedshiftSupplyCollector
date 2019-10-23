#!/bin/bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h|--host)
    REDSHIFT_HOST="$2"
    shift # past argument
    shift # past value
    ;;
    --port)
    REDSHIFT_PORT="$2"
    shift # past argument
    shift # past value
    ;;
    -d|--db)
    REDSHIFT_DB="$2"
    shift # past argument
    shift # past value
    ;;
    -u|--user)
    REDSHIFT_USER="$2"
    shift # past argument
    shift # past value
    ;;
    -p|--pass)
    REDSHIFT_PASS="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

docker run --name postgres -e POSTGRES_PASSWORD=postgres -d postgres 
docker cp RedshiftSupplyCollectorLoader/tests/data.sql postgres:/data.sql
echo $REDSHIFT_HOST:$REDSHIFT_PORT:$REDSHIFT_DB:$REDSHIFT_USER:$REDSHIFT_PASS > .pgpass
docker cp .pgpass postgres:/var/lib/postgresql/.pgpass
docker exec -i postgres chown postgres:postgres /var/lib/postgresql/.pgpass
docker exec -i postgres chmod 600 /var/lib/postgresql/.pgpass
rm -f .pgpass
docker exec -u postgres -it postgres psql -e -h $REDSHIFT_HOST -p $REDSHIFT_PORT -U $REDSHIFT_USER -d $REDSHIFT_DB -w -f /data.sql
docker stop postgres
docker rm postgres
