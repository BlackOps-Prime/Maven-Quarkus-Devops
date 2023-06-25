# Build & Deployment Instructions
This project leverages on GitHub Actions For the CI and Amazon ECS For The CD. The project itself is a Java application that uses Quarkus, the Supersonic Subatomic Java Framework.

To learn more about this framework, you can find more information [here](https://quarkus.io/).

To understand how to execute this project locally, kindly read the README document provided.

You will need to setup the appropriate credentials for this workflow to work properly. You can find the complete list of secrets needed for this workflow below;
| Environment Variable | Description |
| ---------------------| ----------- |
| ```DOCKERHUB_USERNAME```    | Username Of DockerHub Account |
| ```DOCKERHUB_TOKEN```       | UserToken Generated For The DockerHub User |
| ```SLACK_WEBHOOK```         | Slack WebHook URL For Notifications Through Slack |
| ```ECS_SERVICE```           | Service name for Elastic Container Service |
| ```ECS_CLUSTER```           | Cluster name for Elastic Container Service |
| ```AWS_REGION```            | Desired AWS region |
| ```ECS_TASK_DEFINITION```   | Path To your ECS Task Definition JSON file as directed by the documentation provided |
| ```CONTAINER_NAME```        | Contatiner name from the ECS Task Definition JSON file |


-------------------------------
## How The CI is Triggered
After A Pull Request is closed and merged into the main branch, the main repo is checked out and the build process begins.

Maven Builds the Executable package with Java 17 and Exports the artifacts to the targets directory.

The Application is then built using a custom dockerfile for simplicity and shipped to dockerhub for storage and deployment.

## Notifications
The CI uses Slack as a means of notifying build status to the appropriate party through a channel.


## Docker Procedure
### Running the application in Docker
To Execute the application as a container, first pull the image;

```bash
docker pull kr00deapp/e-transact-devops:<tag>
```

Then execute the container using the command below;
```bash
docker run -i --rm -p 8080:8080 e-transact-devops:<tag>
```

----------------------------------------------------------

### Deploying To Elastic Container Service.
Follow the steps laid out in GitHub's [Deploying to Amazon Elastic Container Service](https://docs.github.com/en/actions/deployment/deploying-to-your-cloud-provider/deploying-to-amazon-elastic-container-service) documentation on to setup your AWS environment.


### Deployment Procedure
Once your AWS environment is setup, the CI workflow authenticates against AWS, updates the local task definition file, and deploys the update to ECS.

### Usage
GitHub actions will execute the workflow file automatically whenever the conditions are met; thus, whenever a pull request is merged and closed to the main branch.


### Acknowledgements
Author: Christopher Junior Afeku [BlackOps ❄️] <br>
[GitHub](https://github.com/DO-Christopher)
[LinkedIn](https://www.linkedin.com/in/chris-jnr/)


------------------------------

