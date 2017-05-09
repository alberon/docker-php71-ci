# Docker - PHP 7.1 CI

## Install Docker (Debian)
```
sudo apt-get install docker
sudo usermod -aG docker <username>
```

## Build and locally tag the image
```
docker build -t alberon/php71-ci .
```

## Test by running it locally
You can do whatever you like inside - changes will be thrown away as soon as you exit!

```
docker run -it alberon/php71-ci bash
```

## List local images / tags
```
docker images
```

**Note:** See the [Docker Cloud repo](https://hub.docker.com/r/alberon/php71-ci/)
for a list of *all* tags.

## Tag a new version
(You need a Docker Cloud account with write access)

```
docker login # Only need to do this once
docker tag alberon/php71-ci alberon/php71-ci:0.1
docker push alberon/php71-ci:0.1
```

## Remember to commit and tag in Git as well
And please update the changelog below.

```
git add .
git commit -m "..."
git push

git tag 0.1
git push --tags
```

## Changelog

### 0.1 - Tue 9 May 2017
- Initial setup
