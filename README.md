# Finance Commander

## Table of Contents
- [Introduction](#Introduction)
- [Versions](#Versions)
- [Planned Features](#Planned Features)
- [Build](#Build)
- [Run](#Run)

## Introduction
Finance Commander is going to be a simple application to track and visualize personal checking accounts.

## Versions

### 0.0.1
In the first step you will be able to register banks, owners and accounts. 
Create categories and insert transaction data.

## Planned Features
- Tracking and reporting of checking accounts
- Tracking and reporting of deposit portfolio development
- Monthly upload of statements and automatically insert into database.

## Build
coming soon

## Run

### PostgreSQL Docker Container
I highly recommend using a postgres docker container as database in development mode.
When you have installed docker on your system you can run `./init-database-container.bat` 
to automatically configure the needed container.

If it already exists, and it is not up and running, you can simply start it via `docker start fc-dev`

To psql into the postgres container use `./psql-into-database.bat`

### Initialize Database
Currently, it is not possible to create roles and databases with flyway and connect to if
in the same step. You need to execute the commands in `/src/main/resources/db/init` by hand before you 
can leave all the other database operations to flyway.
You only need to do this on the first time you are going to use the database.

Flyway will perform all commands provided in `/src/main/resources/db/migration` on application start up.
