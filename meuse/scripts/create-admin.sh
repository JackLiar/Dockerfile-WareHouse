#! /bin/bash
# docker exec -it meuse java -jar /app/meuse.jar password 12345678
docker cp ./scripts/create-admin.sql postgres:/create-admin.sql
docker exec -it postgres psql -U meuse -f /create-admin.sql
