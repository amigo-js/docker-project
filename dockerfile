#Base image taken from: https://hub.docker.com/r/cypress/browsers/tags
# FROM node-18.15.0-chrome-111.0.5563.146-1-ff-111.0.1-edge-111.0.1661.62-1
FROM cypress/included:6.8.0
#Create the folder where our project will be stored
RUN mkdir /docker-project
#We make it our workdirectory
WORKDIR /docker-project
#Let's copy the essential files that we MUST use to run our scripts.
COPY ./package.json . 
COPY ./cypress.config.js .
COPY ./cypress ./cypress
#Install the cypress dependencies in the work directory
RUN npm install
#Executable commands the container will use[Exec Form]
ENTRYPOINT ["npx", "cypress", "run"]
#With CMD in this case, we can specify more parameters to the last entrypoint.
CMD [""]