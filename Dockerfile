FROM postgres:10.4-alpine

# default database name for HLF Explorer db connection
ENV DATABASE_DATABASE 	fabricexplorer

# default username for HLF Explorer db connection
ENV DATABASE_USERNAME 	hppoc

# default password for HLF Explorer db connection
ENV DATABASE_PASSWORD 	password

RUN apk update \
 && apk add jq \
 && apk add nodejs \
 && apk add sudo \
 && apk add git \
 && rm -rf /var/cache/apk/*

RUN git clone --single-branch -b master --depth 1 https://github.com/hyperledger/blockchain-explorer /opt/explorer

WORKDIR /opt/explorer/app/persistence/fabric/postgreSQL/db/

ENV PATH="/opt/explorer/app/persistence/fabric/postgreSQL/db/:${PATH}"

