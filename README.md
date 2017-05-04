## SASS Docker Container.
[![Docker Pulls](https://img.shields.io/docker/pulls/rvannauker/sass.svg)](https://hub.docker.com/r/rvannauker/sass/) [![Docker Stars](https://img.shields.io/docker/stars/rvannauker/sass.svg)](https://hub.docker.com/r/rvannauker/sass/) [![](https://images.microbadger.com/badges/image/rvannauker/sass:latest.svg)](https://microbadger.com/images/rvannauker/sass:latest) [![GitHub issues](https://img.shields.io/github/issues/RichVRed/docker-sass.svg)](https://github.com/RichVRed/docker-sass) [![license](https://img.shields.io/github/license/RichVRed/docker-sass.svg)](https://tldrlegal.com/license/mit-license)

Docker container to install and run sass

### Installation / Usage
1. Install the rvannauker/sass container:
```bash
docker pull rvannauker/sass
```
2. Run sass through the sass container:
```bash
sudo docker run --rm --volume $(pwd):/src --name="sass" "rvannauker/sass"
```

### Download the source:
To run, test and develop the SASS Dockerfile itself, you must use the source directly:
1. Download the source:
```bash
git clone https://github.com/RichVRed/docker-sass.git
```
2. Build the container:
```bash
sudo docker build --force-rm --tag "rvannauker/sass" --file sass.dockerfile .
```
3. Test running the container:
```bash
 $ docker run rvannauker/sass --help
```