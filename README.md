# Continuous Integration/Deployment
- Michael Albright

The contents of this repository involve running [angular](angular-site) in a container using Docker, and updating and re-running the container using webhook.

## CI: Continuous Integration
[README-CI.md](README-CI.md)
* Running a site using a Docker container
  * Using a Dockerfile to build a container
* Utiziling a workflow and GitHub Actions to update the image in Docker Hub
  * Pushes a new image built by a (possibly) updated Dockerfile

## CD: Continuous Deployment
[README-CD.md](README-CD.md)
* Using semantic versioning when updating a Docker image
  * Changing the workflow to update the image's tags
* Starting a webhook service to update a container
  * Docker Hub informs the webhook when a repository is pushed to
  * The webhook in an instance runs a script that pulls a new image and runs a new container

## Other contents
* [.github/workflows](.github/workflows)
  * Contains a workflow that will run under certain conditions
* [angular-site](angular-site)
  * The site that the container will run a server for
* [deployment](deployment)
  * Various files involving webhooks
    * A [condition file](hooks.json)
    * A [script file](run-deploy.sh)
    * A [service file](webhook.service)
* [images](images)
  * Images used in the `README` files.
