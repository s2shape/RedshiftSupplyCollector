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

mkdir RedshiftSupplyCollectorTests/Properties
echo { > RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo   \"profiles\": { >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo     \"RedshiftSupplyCollectorTests\": { >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo       \"commandName\": \"Project\", >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo       \"environmentVariables\": { >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo         \"REDSHIFT_HOST\": \"${REDSHIFT_HOST}\", >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo         \"REDSHIFT_USER\": \"${REDSHIFT_USER}\", >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo         \"REDSHIFT_DB\": \"${REDSHIFT_DB}\",  >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo         \"REDSHIFT_PORT\": \"${REDSHIFT_PORT}\",  >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo         \"REDSHIFT_PASS\": \"${REDSHIFT_PASS}\" >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo       } >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo     } >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo   } >> RedshiftSupplyCollectorTests/Properties/launchSettings.json
echo } >> RedshiftSupplyCollectorTests/Properties/launchSettings.json

dotnet build
dotnet test
