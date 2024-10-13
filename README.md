# Running

A semi-simple way to run SonarQube locally for code analysis. Intended to be used at hackathons etc. after which the
environment can be easily destroyed.

## SonarQube server

```shell
# Adjust system limits to accommodate needs of Elastic
sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192

# Start SonarQube server
docker compose up -d
```

Database, logs etc. are preserved in their approproate subfolders under the installation.

Open up `http://localhost:9000` and change the password for the admin user, as requested. Make note of the password as
its needed to run the code analysis.

## SonarQube scanner

```bash
# Build the SonarQube scanner container
bash build-sonarscanner-cli-docker.sh

# Run code analysis
docker run -it --rm --network sonarqube_default -v /path/to/project:/usr/src sonarqube-sonarscanner:latest -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=admin -Dsonar.password='<password>' -Dsonar.projectKey='<project:key>'
```
