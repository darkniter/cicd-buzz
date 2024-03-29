#!/bin/sh
docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
echo docker build -t $TRAVIS_REPO_SLUG:$TAG .
docker build -t $TRAVIS_REPO_SLUG:$TAG .
docker push $TRAVIS_REPO_SLUG