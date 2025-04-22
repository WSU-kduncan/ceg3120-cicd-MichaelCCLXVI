# Project 5
Michael Albright


## Project Overview
**This Project Involves**:
- Implementing semantic versioning with GitHub Actions and `git tag`
- Using `webhook`s to keep production up to date

**Tools involved**:
- Ubuntu & Docker
- GitHub Actions
- webhook


## Tagging
* Using the `git tag` command to create tags
* To see any existing tags in the repository:
  * `git tag`
* To create a new tag (v1.0.1 for example):
  * `git tag -a v1.0.1`
* To push a tag to a repository
  * `git push origin v1.0.1`

### GitHub Actions: Semantic Versioning
* The [workflow file](.github/workflows/update-docker.yml) builds the image from the Dockerfile in the root repository and pushes it to the Docker repository with tags.
* The workflow happens after either:
  * A push to the `main` branch
  * A push to a new tag
* Steps:
  * Docker metadata
    * Gets data from Docker and tags
    * Sets up new tags for the next docker push
  * Checkout & Set up docker buildx
    * Both of these steps set up necessary components for other steps.
  * Login to Dockerhub
    * Logs in to Dockerhub to access the repository
    * Two secrets are used here to login: `DOCKER_USERNAME` and `DOCKER TOKEN`
    * Secrets may vary by person
  * Build & push
    * First, this step builds an image from the Dockerfile and also tags it with the repository name (and latest)
      * This part also uses two secrets: `DOCKER_USERNAME` and `DOCKER_REPO`
    * Second, the created image pushes the new image to the docker repository, replacing the current image with the name and tag

Evidence the workflows worked:
![The GitHub Action ran](images/GitHubActionRan.png)
![The Docker images with versions](images/DockerSemanticVersion.png)
These images were taken at roughly the same time.



### Sources:
* https://docs.docker.com/build/ci/github-actions/manage-tags-labels/
* https://stackoverflow.com/questions/5195859/how-do-you-push-a-tag-to-a-remote-repository-using-git
