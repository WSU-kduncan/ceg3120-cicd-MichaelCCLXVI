FROM node:18-bullseye

COPY angular-site .

WORKDIR /wsu-hw-ng-main

RUN npm install -g @angular/cli

RUN npm install

CMD ng serve --host 0.0.0.0
