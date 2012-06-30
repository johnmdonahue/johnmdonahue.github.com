---
layout: post
title: Installing Node from GitHub
meta:
  reqs: [Node 0.6.10, Mac OSX 10.6]
tags:
- github
- node
---

Node already has an awesome [installer](http://nodejs.org) as well as a
few version manager options
([creationix/nvm](https://github.com/creationix/nvm/),
[visionmedia/n](https://github.com/visionmedia/n/)). But if you just
want the flexibility to stay on the bleeding edge or install from a
specific commit/tag of interest, building from GitHub is a great
alternative.

<!-- more -->

## Clone or fork the repo

```text
$ git clone https://github.com/joyent/node.git && cd node
```

## Select a tag or commit to build

```text
$ git tag
v0.5.6
v0.5.7
...
v0.6.1
v0.6.10
$ git checkout v0.6.10
```

## Build

```text
$ ./configure
$ make
$ make install
$ node -v
v0.6.10
```

Post install, I like to put the seat back down and checkout `master` so
it's primed and ready to let me quickly jump back in and grab the latest
goodness.

```text
$ cd node && git pull
$ git checkout badass-newness
```

