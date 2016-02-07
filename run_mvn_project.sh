#!/bin/bash

# -----------------Configurable Section------------------------------


GIT_REPOSITORY_URL="ssh://zero@zero/var/lib/public/incubator"
PROJECT_NAME="incubator"
PROJECT_LOCATION="/opt/incubator"
REMOTE_NAME="zero"
BRANCH_NAME="refactoring"

cd $PROJECT_LOCATION
git pull $REMOTE_NAME $BRANCH_NAME

echo pgrep --full maven

mvn clean install
cd incubator.web

echo pgrep --full maven
pkill --full maven

mvn clean package tomcat7:run-war-only
