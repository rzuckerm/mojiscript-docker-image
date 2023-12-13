FROM node:8.17-alpine3.9

COPY MOJISCRIPT_* /tmp/
RUN apk update && \
    apk add git && \
    npm install -g mojiscript-cli@$(cat /tmp/MOJISCRIPT_CLI_VERSION) && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://github.com/joelnet/mojiscript-starter-app && \
    cd mojiscript-starter-app && \
    git reset --hard $(cat /tmp/MOJISCRIPT_STARTER_APP_COMMIT_HASH) && \
    npm ci && \
    rm -rf .git* .vscode src && \
    mkdir src && \
    apk del git
