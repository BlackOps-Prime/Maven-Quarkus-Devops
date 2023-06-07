### Deployment Instructions

This project leverages on GitHub Actions For the CI and Amazon ECS For The CD.


On Push, the main repo is checked out and the build process begins.

Maven Builds the package with Java 17 and Exports the artifacts to the targets directory.

### Docker Procudure
The Application is build using a custom dockerfile for simplicity and shipped to dockerhub for storage and retrieval.


## Running the application in Docker
```bash
docker pull kr00deapp/e-transact-devops:latest
```

```bash
docker run -i --rm -p 8080:8080 e-transact-devops:latest
```

### Usage
You can use this build process