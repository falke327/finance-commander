docker --version
:: checks docker version

cd ..
cd ..
mkdir db-data
cd db-data
:: create local directory to store the data for local development database

docker pull postgres:alpine
:: pulls latest postgres:alpine image

docker network create fc-db
:: creates docker network

docker run --name fc-dev -p 51010:5432 --network=fc-db -v "%cd%:/var/lib/postgresql/data" -e POSTGRES_PASSWORD=password -d postgres:alpine
:: runs a docker container
:: - named fc-dev
:: - forwarding local port 51010 to container port 5432
:: - using the docker network fc-db
:: - mounts current folder as data volume into the container
:: - sets the environment variable for postgres password to password
:: - runs the container in detached mode
:: - uses latest postgres:alpine image

docker ps -a
:: shows if container is up and running
