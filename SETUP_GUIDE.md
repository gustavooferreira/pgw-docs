# Setup Guide

To spin up all the components locally, I've provided a `docker-compose` file.

The `docker-compose` file is located in this repository to avoid creating yet another repo.

First, you will have to generate the docker images for all 3 services mentioned in the [readme](README.md) and [design document](SYSTEM_DESIGN.md).

To build the images, all you need to do is clone each service's repo, and while inside each repo's folder, run:

```bash
make build-docker
```

**NOTE:** If you try to build these docker images on a Mac with a M1 processor you might face issues. On line 20 of the `Dockerfiles` I'm pinning the architecture to x86-64. If you face issues, please remove `GOARCH=amd64` from the `go build` command.

Once you have all the 3 images in your local docker images cache, you can start the environment.

To start the development environment please run the following command:

```bash
make start-docker-env
```

Once the environment is started, you will need to wait around 30 to 40 seconds for the MySQL database to be fully ready. The Payment gateway service won't be operational until the database is ready.

Only start exploring the environment once you get a 200 response on the `Mgmt API` healthcheck:

```bash
curl -i http://localhost:9001/api/v1/healthcheck
```

To stop the development environment please run the following command:

```bash
make stop-docker-env
```

---

## Environment details

Both API ports are exposed on the host as follows:

- Merchant API port: 9000
- Management API port: 9001

You can immediately start firing requests to those APIs according to the instructions in the [usage guide](USAGE.md).

For more details about the APIs, please find their respective specifications in the [openapi directory](openapi).
