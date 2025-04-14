# Project 4
Michael Albright


**This project involves**:
- running an application using a container with Docker
- automating the pipeline with Github Actions

**Tools used**:
- Ubuntu & Docker
- nginx
- angular

## Running the Project
Using Windows 11 or Ubuntu 22.04, installing docker is easy.
For Windows 11:
* Go to [This link](https://docs.docker.com/desktop/setup/install/windows-install/) and click the `Docker Desktop for Windows - x86_64` button
* When finished downloading, open `Docker Desktop Installer.exe` and configure.
* When prompted, select **Use WSL2 instead of HyperV**
* Continue to follow instructions to install, then click `Close` when completed.

For Ubuntu/WSL2:
* Use the command `sudo apt install docker`

### Running the container manually
Using docker with Ubuntu:
* Use command `docker pull node:18-bullseye` to get the appropriate image
* Then, use the command `docker run -it node:18-bullseye bash` to create the container, start it, and attach to it with `bash`
  * May need to restart it after exiting the container configuration.
* Get the compressed `angular-bird.zip` file with the command `wget https://github.com/pattonsgirl/CEG3120/raw/refs/heads/main/Projects/Project4/angular-bird.zip`
* Unzip it and relocate the files with the command `unzip angular-bird.zip -d angular-site`
* Change directory with `cd angular-site/wsu-hw-ng-main/`
* Use command `npm install -g @angular/cli`, then if necessary just `npm install`
* Start the server with the command `ng serve --host 0.0.0.0` to open it to all IP addresses.
  * There will be no command line to enter commands into once the server is running.
  * Confirm the server is running by connecting to the instance in another ubuntu window and use the command `curl 0.0.0.0`.

### Building an image with a Dockerfile
Once again using docker with Ubuntu, multiple different lines are needed in the `Dockerfile` to run Angular, including:
* `FROM`, followed by the base image, in this case: `node:18-bullseye`
* `COPY`, followed by the directory to copy from (in your system), followed by the directory to copy to (in the image filesystem)
  * NOTE: The `COPY` line copiess the source directory's CONTENTS, not the directory itself.
* `WORKDIR`, followed by the directory to run commands from in the image filesystem.
  * NOTE: Best to put this line after the `COPY` line.
* `RUN`, followed by a command to run in the image
  * NOTE: Multiple `RUN` lines are allowed, each will run one after another.
* `CMD`, followed by the command to run when a container runs this image.
  * NOTE: If multiple `CMD` lines exist, only the last one will run when a container uses this image.
For this part of the project, the `Dockerfile` contains these lines:
```
FROM node:18-bullseye

COPY angular-site .

WORKDIR /wsu-hw-ng-main

RUN npm install -g @angular/cli

RUN npm install

CMD ng serve --host 0.0.0.0
```
To validate these lines, perform the same steps as in the previous section:
  * There will be no command line to enter commands into once the server is running.
  * Confirm the server is running by connecting to the instance in another ubuntu window and use the command `curl 0.0.0.0`.

### Push Dockerfile image to Dockerhub
This part can get a bit tricky. If the image was named improperly, the `docker` command line will not push properly.  Tofix this:
* `docker logout`
* Change the name of the image with the command `docker tag <imageId> username/dockerrepo`
* Log back in using a Personal Access Token instead of a password
  * Log in to docker through a web explorer
  * Go to `Account Settings` under the user icon, then to the `Personal access tokens` tab.
  * Create a Personal access token with the proper permissions, then follow given instructions.
* Push the image to the repo with the command `docker push username/dockerrepo`


### Sources:
* https://stackoverflow.com/questions/36663742/docker-unauthorized-authentication-required-upon-push-with-successful-login/42300879#42300879
