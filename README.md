# Devops-Capstone
Project to build nginx image, push to docker hub, update the pre created cluster with image.
Project includes following Jenkins pipeline Tasks:
`1.`  Creating Docker Image of simiple nginx webserver.

`2.`  Upload the image to dockerhub

`3.`  Created the eks cluster using scripts.

`4.`  update the cluster with image from dockerhub

# How to run

Trigger the Jenkins build job. Jenkins build job has following steps:

`1.`  Lint html file

`2.`  Build docker image - pulls the Docker file from github and builds the image.

`3.`  Push Docker Image - Push the docker image to the Dockerhub.

`4.`  Deploy - deploy the image from dockerhub to AWS eks cluster.