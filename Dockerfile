FROM node:12

# Install nessecary dependencies
RUN apt-get update && apt-get install bash openjdk-8-jdk  git python3 make -y

# Install npm tools needed for build
RUN npm i -g turtle-cli expo-cli --unsafe-perm

# Prepare environment for android and expo sdk 43
RUN turtle setup:android --sdk-version 43.0.0

# Make expo-build-android availabke globally
COPY src/expo-turtle-builder /usr/local/bin
RUN chmod +x /usr/local/bin/expo-turtle-builder

# Go to /build directory to allow mounting of volumes
RUN mkdir build
WORKDIR /build

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD ["expo-turtle-builder"]
