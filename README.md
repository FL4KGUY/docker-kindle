# docker-kindle

Kindle in Docker.

## Usage

Clone the repository and build the image.

```sh
git clone git@github.com:predkambrij/docker-kindle.git
cd docker-kindle
./genenv.sh
docker-compose build
```

Make it possible to connect to X server

```sh
xhost +
```

Launch Kindle with:

```sh
docker-compose up -d
```

Note:

- first time you'll launch the container, it'll prompt you to install Mono for .NET and Gecko package (twice)
- next time it'll open Kindle

Known issues:

- highlights aren't working
