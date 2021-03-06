# webofmars/asdf

[![Build Status](https://travis-ci.org/webofmars/docker-asdf.svg?branch=master)](https://travis-ci.org/webofmars/docker-asdf)

Simple image based on [https://github.com/asdf-vm/asdf]()
Allow to install and use a set of tools by setting up a `.tool-versions` in your folders hierarchy.

* More infos at [https://asdf-vm.com]()
* Gihtub repo: https://github.com/webofmars/docker-asdf

## Available tags

See here: [https://github.com/webofmars/docker-asdf/blob/master/versions.txt]()

Tags are the same of the versions published in this repo (v0.7.8 as time of writting)

## Usage

### As a working tool on your desktop

Exemple with kubectl:

* `docker run --rm -it -v $HOME/.kube/config:/home/asdf/.kube/config -it webofmars/asdf`
* `asdf install kubectl 1.17.5`
* `asdf local kubectl 1.17.5`
* `kubectl version --short`

### In your ci/cd builds

Ex with `.gitlab-ci.yml`: TO BE DONE

### In you own Dockerfiles

Ex install Node.js:

```Dockerfile
FROM webofmars/asdf

RUN asdf plugin add nodejs && \
    asdf install nodejs 14.2.0 && \
    asdf global version 14.2.0

...

ENTRYPOINT ["npm", "start"]
```
