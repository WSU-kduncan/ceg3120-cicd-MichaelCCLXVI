![image](https://github.com/user-attachments/assets/41bef3e0-c8ef-492a-ab1d-3b9adccb9134)# Project 4
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
* Change directory with `cd angular-site/wsu-hw/`
* Use command `npm install -g @angular/cli`, then if necessary just `npm install`
* Start the server with the command `ng serve --host 0.0.0.0` to open it to all IP addresses.
