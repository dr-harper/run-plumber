FROM rocker/r-base

RUN apt-get update -qq 

RUN apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libpq-dev \
  libssh2-1-dev \
  libsasl2-dev \
  libssl-dev \
  libcurl4-gnutls-dev 

RUN install2.r --error --deps TRUE \
    tidyverse \
    dplyr \
    xts \
    plumber

# EXPOSE $PORT

WORKDIR /app

COPY . .

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]

CMD ["api.R"]
