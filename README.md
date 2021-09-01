# drone-rocketchat [![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/joseluisq/drone-rocketchat/latest)](https://hub.docker.com/r/joseluisq/drone-rocketchat/) [![Docker Image Size (tag)](https://img.shields.io/docker/image-size/joseluisq/drone-rocketchat/latest)](https://hub.docker.com/r/joseluisq/drone-rocketchat/tags)

> [Drone](https://www.drone.io/) updated plugin for sending [Rocket.Chat](https://rocket.chat) messages to a channel using the latest [REST API v1](https://developer.rocket.chat/api/rest-api/).<br>
> **Note:** This a provisional only and upgraded fork of [github.com/mike1pol/drone-rocket](https://github.com/mike1pol/drone-rocket).

## Usage

### Using the binary

```sh
drone-rocketchat \
  --url="http://chat.example.org" \
  --user-id="" \
  --token="" \
  --channel="" \
  --message="Test Message"
```

### Using Docker

```sh
docker run --rm \
  -e URL="http://chat.example.org" \
  -e USER_ID="" \
  -e TOKEN="" \
  -e CHANNEL='#general' \
  -e AVATAR_URL="http://example.org/img.png" \
  -e MESSAGE="Test Message" \
  joseluisq/drone-rocketchat
```

### Using Drone CI

Execute from the working directory:

```sh
docker run --rm \
  -e URL="http://chat.example.org" \
  -e USER_ID="" \
  -e TOKEN="" \
  -e CHANNEL="#general" \
  -e AVATAR_URL="http://example.org/img.png" \
  -e MESSAGE="Test Message" \
  -e DRONE_REPO_OWNER=joseluisq \
  -e DRONE_REPO_NAME=drone-rocketchat \
  -e DRONE_COMMIT_SHA=54540780fdda0a1b23e243abc3a9226a9f982ac7 \
  -e DRONE_COMMIT_BRANCH=master \
  -e DRONE_COMMIT_AUTHOR=joseluisq \
  -e DRONE_COMMIT_AUTHOR_EMAIL=abc@example.org \
  -e DRONE_COMMIT_MESSAGE=test_your_commit \
  -e DRONE_BUILD_NUMBER=1 \
  -e DRONE_BUILD_STATUS=success \
  -e DRONE_BUILD_LINK=http://github.com/joseluisq/drone-rocketchat \
  -e DRONE_JOB_STARTED=1244550580 \
  -e DRONE_JOB_FINISHED=1244550580 \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  joseluisq/drone-rocketchat
```
