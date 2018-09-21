FROM postgres:10.4-alpine

# default database name for HLF Explorer db connection
ENV DATABASE_NAME   	fabricexplorer

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

COPY createdb.sh /docker-entrypoint-initdb.d/

COPY *.sql /tmp/
