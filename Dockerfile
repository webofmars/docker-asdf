FROM alpine:3

LABEL maintainer='Frederic Leger <contact@webofmars.com>'

ARG ASDF_VERSION=v0.7.8

RUN apk --no-cache upgrade && \
    apk add --no-cache git curl bash zsh

RUN adduser -s /bin/bash -D -u 1000 asdf

USER asdf

RUN curl -fL -Ss -o /tmp/asdf.tar.gz https://github.com/asdf-vm/asdf/archive/${ASDF_VERSION}.tar.gz && \
    mkdir -p $HOME/.asdf && \
    tar -zxvf /tmp/asdf.tar.gz -C $HOME/.asdf --strip-components=1 && \
    rm /tmp/asdf.tar.gz

COPY --chown=asdf:asdf .tool-versions /home/asdf/.tool-versions

ENV LANG=C.UTF-8 PATH=/home/asdf/.asdf/bin:/home/asdf/.asdf/shims:$PATH
WORKDIR /home/asdf

# install plugins and versions
RUN asdf plugin-add kubectl  && \
    asdf plugin-add helm     && \
    asdf plugin-add skaffold && \
    asdf plugin-add velero

ENTRYPOINT ["/bin/bash", "-c"]
