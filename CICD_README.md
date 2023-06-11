# Deployment Instructions

This project leverages on GitHub Actions For the CI and Amazon ECS For The CD.
You will need to setup the appropriate credentials for this workflow to work properly. You can find the complete list of secrets needed for this workflow below;
```
DOCKERHUB_USERNAME - Username Of DockerHub Account
DOCKERHUB_TOKEN - UserToken Generated For The DockerHub User
SLACK_WEBHOOK - Slack WebHook URL For Notifications Through Slack
```
### How The CI is Triggered

After A Pull Request is closed and merged into the main branch, the main repo is checked out and the build process begins.

Maven Builds the Executable package with Java 17 and Exports the artifacts to the targets directory.

### Notifications
The CI uses Slack as a means of notifying build status to the appropriate party through a channel.

### Docker Procedure
The Application is built using a custom dockerfile for simplicity and shipped to dockerhub for storage and retrieval.

## Running the application in Docker
To Execute the application as a container, first pull the image;

```bash
docker pull kr00deapp/e-transact-devops:latest
```

Then execute the container using the command below;
```bash
docker run -i --rm -p 8080:8080 e-transact-devops:latest
```


### Usage
You can use this build process