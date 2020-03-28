#! /bin/sh

svn update

mkdir /srv/arcanjo-db/

docker ps -a | awk '{ print $1,$2 }' | grep projetoarcanjo/arcanjo-db:1.0 | awk '{print $1 }' | xargs -I {} docker rm -f {}
docker rmi projetoarcanjo/arcanjo-db:1.0
docker build --tag=projetoarcanjo/arcanjo-db:1.0 --rm=true .

docker run --name arcanjo-db --hostname=arcanjo-db \
-e POSTGRES_PASSWORD=@rcanjo \
-e POSTGRES_DB=arcanjo \
-v /srv/arcanjo-db/:/var/lib/postgresql/data/ \
-v /etc/localtime:/etc/localtime:ro \
-p 36009:5432 \
-d projetoarcanjo/arcanjo-db:1.0

docker network connect arcanjo arcanjo-db

echo "Aguardando a imagem... (15 segundos)"
sleep 15

docker exec -it arcanjo-db psql -U postgres arcanjo -f /opt/arcanjo-db/arcanjo.sql

