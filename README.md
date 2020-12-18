# Containers
Contains Docker files etc. to create Docker Images

# Usage

### Build Image

`docker build -t MyImageName .`

### Build Container = Run Image

`docker run -i -t --name MyContainerName MyImageName bash`

### Restart Container

`docker restart MyContainerName`

`docker exec -i -t  MyContainerName bash`
