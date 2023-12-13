#!/bin/sh
DOCKER_IMAGE=$1
DOCKER_RUN="docker run --rm -i -v $(pwd):/local -w /local ${DOCKER_IMAGE}"

CMD="cp hello_world.mjs /opt/mojiscript-starter-app/src/ && \
    cd /opt/mojiscript-starter-app && \
    node --experimental-modules --no-warnings src/hello_world.mjs"
RESULT="$(${DOCKER_RUN} sh -c "${CMD}")"
echo "${RESULT}"
if [ "${RESULT}" = "Hello, world!" ]
then
    echo "PASSED"
else
    echo "FAILED"
    exit 1
fi
