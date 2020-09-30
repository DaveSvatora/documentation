# Postgresql

Postgresql is a very popular opensource relational database.

## Installation

Installing PGAdmin4 through `APT` package manager is a good way to get Postgresql set up on a Ubuntu based distro, here's the latest instructions.

<a href="https://www.pgadmin.org/download/pgadmin-4-apt/" target="_blank" class="md-button">PGAdmin4 Intallation Instructions</a>

## Creating a database using docker

Docker is a fun way to run a database, and a good way to learn about **Docker Volumes**. Here's a simple way to start.

Create a folder structure like so...

```sh
/db
    Dockerfile
    /scripts
        database-definition.sql
```

### Dockerfile

```Dockerfile
FROM postgres:alpine
COPY scripts/ /docker-entrypoint-initdb.d
```

### SQL

```sql
CREATE SCHEMA postgres AUTHORIZATION postgres;

CREATE SEQUENCE kidseq START 1;

CREATE TABLE postgres.kid (
    kid_id numeric NOT NULL DEFAULT nextval('kidseq') PRIMARY KEY,
    kid_name text,
    balance money
);
```

### Build your image

```sh
docker build -t mydatabase .
```

### Run it

```sh
docker run --rm -it -p 5432:5432 -e POSTGRES_PASSWORD=<DatabasePassword> mydatabase
```

## Connect with PGAdmin4

<a href="" target="_blank" class="md-button">Connection Instructions</a>