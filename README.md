<div align="center">
  <img src="https://github.com/lambdaclass/lambcast/assets/30054528/feef1ca5-90d0-4846-9fbd-de8fb9653813" width="150"/>

  ### 🐐 Lambcast 🐐

  A Farcaster client implementation in Elixir

  ⚠️ This repository is currently a WIP 🔧
</div>

# Requirements

- Elixir 1.16.1
- Mix 1.16.1
- Docker (optional)

# Development Guide

A PostgreSQL database is needed. This database will tipically be a replicator of the Hubs.

The following env vars are required and can be placed in a .env file (you can use .env.example as a guide)

```
DATABASE_HOST
DATABASE_PORT (default: 5432)
DATABASE_NAME
DATABASE_USER
DATABASE_PASSWORD
```

You can start a database in Docker with the following command.

```sh
docker run \
    --name lambcast_db \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    -p 5432:5432 \
    -d postgres
```

Now, start Phoenix:
  - Run `make setup` to install and setup dependencies.
  - Run `make dev` to start the server.
