# Finance Commander

## Table of Contents
- [Introduction](#Introduction)
- [Versions](#Versions)
- [Build](#Build)
- [Run](#Run)

## Introduction
coming soon

## Versions

### 0.0.1

## Build

## Run

### PostgreSQL Docker Container
I highly recommend using a postgres docker container as database in development mode.
When you have installed docker on your system you can run `./init-database-container.bat` 
to automatically configure the needed container.

If it already exists, and it is not up and running, you can simply start it via `docker start fc-dev`

To psql into the postgres container use `./psql-into-database.bat`