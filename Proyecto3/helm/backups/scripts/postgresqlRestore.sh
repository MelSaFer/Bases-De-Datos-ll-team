#!/bin/bash

# Variables de configuración
ARCHIVE_NAME="archive.gz"       # Nombre del archivo de respaldo en el Blob Storage
CONNECTION_STRING_AZURE="DefaultEndpointsProtocol=https;AccountName=filesmanagermangos;AccountKey=71ms2t3YFnW7Qu4KllgC1PR5adRZVUhbqKGn7mIXaQI0ZgF7ougQUR0LWhf7icECM98YdV9c2grT+ASt8ZXu+g==;EndpointSuffix=core.windows.net"

mkdir -p postgresqlrestore/202306151558

apk update
apk upgrade
apk add postgresql-client

az config set extension.use_dynamic_install=yes_without_prompt

# Descargar el respaldo desde Azure Blob Storage
az storage blob download --container $CONTAINER --name mongo/$BACKUP_NAME/$ARCHIVE_NAME --file mongorestore/$BACKUP_NAME --auth-mode key --connection-string $CONNECTION_STRING_AZURE

PGPASSWORD="$POSTGRESQL_PASSWORD" pg_restore --host $DB_HOST -U $POSTGRESQL_USERNAME --dbname=<nombre_de_base_de_datos_destino> $BACKUP_FILE
