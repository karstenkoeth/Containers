# Docker Container with Ubuntu 18.04 prepared for hosting SICK AppEngine Linux x86-64

# Usage

### Build Image

`docker build -t MyImageName .`

### Build Container = Run Image

`docker run -i -t --name MyContainerName MyImageName bash`

### Restart Container

`docker restart MyContainerName`

`docker exec -i -t  MyContainerName bash`

# Content

Some packages are installed with apt-get.
The bashutils are injected with git.
