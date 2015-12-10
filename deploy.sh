#!/usr/bin/bash -e

# All steps necessary to deploy correctly.
# Assume a running instance.

unset GIT_DIR
COMPOSE=/usr/bin/docker-compose
DOCKER=/usr/bin/docker

[ -f "$COMPOSE" ] || ( echo "$COMPOSE" not found. || exit 1 )
[ -f "$DOCKER" ] || ( echo "$DOCKER" not found. || exit 1 )

echo Starting Deployment:
echo \- commit \: $(git rev-parse --verify HEAD)
echo \- branch \: $(git rev-parse --abbrev-ref HEAD)
echo \- date   \: $(date)
echo \- pwd    \: $(pwd)
"$COMPOSE" stop
"$COMPOSE" up -d
sleep 15s
./restore-mysql.sh
echo Successfully deployed.
