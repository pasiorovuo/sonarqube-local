#!/bin/bash

dir="build"

mkdir -p "${dir}/bin"

# Run everything in a subshell
(
    cd "${dir}" &&
    curl -O "https://raw.githubusercontent.com/SonarSource/sonar-scanner-cli-docker/refs/heads/master/Dockerfile" &&
    cd "bin" &&
    curl -O "https://raw.githubusercontent.com/SonarSource/sonar-scanner-cli-docker/refs/heads/master/bin/entrypoint.sh" &&
    chmod +x "entrypoint.sh"
    cd - &&
    docker build -t sonarqube-sonarscanner:latest .
)
