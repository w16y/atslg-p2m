# plateau2minecraft-docker

Docker for [plateau2minecraft](https://github.com/Project-PLATEAU/plateau2minecraft).

## Setup

```bash
docker compose build
```

## Usage

Place CityGML files in `data/input/`, then:

```bash
# Convert all files in data/input/
docker compose run --rm --entrypoint /app/convert-all.sh plateau2minecraft

# Or manually specify files
docker compose run --rm plateau2minecraft \
  --target /app/data/input/file1.gml /app/data/input/file2.gml \
  --output /app/data/output/
```

Generated `.mca` files will be in `data/output/world_data/region/`

## License

The original [plateau2minecraft](https://github.com/Project-PLATEAU/plateau2minecraft) is also licensed under MIT License by MLIT Japan and MIERUNE Inc.
