# webofmars/asdf

Simple image based on [https://github.com/asdf-vm/asdf]
Allow to install and use a set of tools by setting up a `.tool-versions` in your folders hierarchy.

More infos at [https://asdf-vm.com]

## available tags

See here: [https://github.com/asdf-vm/asdf/releases]

Tags are the same of the versions published in this repo (v0.7.8 as time of writting)

## usage

### as a working tool on your desktop

Ex with kubectl:
    - `docker run --rm -it -v $HOME/.kube/config:/home/asdf/.kube/config -it webofmars/asdf`
    - `asdf install kubectl 1.17.5`
    - `asdf local kubectl 1.17.5`
    - `kubectl version --short`

### in your ci/cd builds

Ex with `.gitlab-ci.yml`:
    - TBD

### in you own Dockerfiles

Ex install Node.js:

```Dockerfile
FROM webofmars/asdf

RUN asdf plugin add nodejs && \
    asdf install nodejs 14.2.0 && \
    asdf global version 14.2.0

...

ENTRYPOINT ["npm", "start"]
```
