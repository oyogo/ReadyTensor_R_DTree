FROM rocker/r-ver:4.1.0
#FROM rstudio/plumber

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  curl \
  libsodium-dev \
  libxml2-dev 


RUN R -e "install.packages('data.table', dependencies=T)"
RUN R -e "install.packages('rjson', dependencies=T)"
RUN R -e "install.packages('plumber', dependencies=T)"
RUN R -e "install.packages('jsonlite', dependencies=T)"
RUN R -e "install.packages('tidyr', dependencies=T)"
RUN R -e "install.packages('fastDummies', dependencies=T)"
RUN R -e "install.packages('dplyr', dependencies=T)"
RUN R -e "install.packages('caret', dependencies=T)"
RUN R -e "install.packages('nnet', dependencies=T)"
RUN R -e "install.packages('rpart', dependencies=T)"


COPY ./src /opt/src
WORKDIR /opt/src

ENV PATH="/opt/src:${PATH}"

RUN chmod +x train &&\
    chmod +x predict &&\
    chmod +x serve


#CMD R -e "source('train.R')" && R -e "source('plumberscript.R')"
