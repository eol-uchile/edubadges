# Use an official Node runtime as the base image
FROM node:16.20.0

# Set the working directory in the container to /app
# WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git

# Clone the repository into a subdirectory
# RUN git clone https://github.com/edubadges/edubadges-ui.git ./edubadges-ui
RUN git clone https://github.com/tomaspemora/edubadges-ui.git ./edubadges-ui

# # Change the working directory to the new subdirectory
WORKDIR /edubadges-ui

# # Install any needed packages specified in package.json
RUN yarn set version 1.22.2
RUN yarn install
# # RUN yarn dev

# # Make port 5000 available to the world outside this container
# EXPOSE 5000

# # Run the app when the container launches
# CMD ["yarn", "dev"]

# RUN yarn && \
#     yarn run build && \
#     yarn cache clean
# RUN yarn add --dev mini-css-extract-plugin
# yarn add --dev
# RUN sed -i '/mini-css-extract-plugin/d' webpack.config.js
CMD [ "yarn", "dev" ]
EXPOSE 4000