docker run -it --rm --network=fc-db postgres:alpine psql -h fc-dev -U postgres
:: - runs a container in interactive mode
:: - removes container after use
:: - using the docker network fc-db
:: - uses latest postgres:alpine image
:: - starts psql command on host container fc-dev
:: - with user postgres
