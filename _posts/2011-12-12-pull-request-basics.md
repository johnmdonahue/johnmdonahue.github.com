---
layout: post
title: Pull Request Basics 
subtitle: 
---

I've dropped my share of git bombs and still do, so I know it can be a real pain in the ass &mdash; and a bit embarassing &mdash; to skip a rebase/pull/merge when working on a pull request, so here's a generic quick reference for the standard GitHub contribution workflow. Every project has it's own guidelines but this should cover the basics.

<!-- more -->


## Fork

Fork the original repo on GitHub and clone it locally.

```text
$ git clone git@github.com:you/repo.git
$ cd repo
```

## Add upstream

Add the original repository as a remote named upstream. This gives you a
 to pull remote changes.

```text
$ git remote add upstream git://github.com/original/repo.git
```

## Branch

Create a topic branch.  If your pull request is a new feature, you
will probably need to work from a development branch rather than
`master`. For example, many projects use a `develop` or `*-wip` branch
for this. A hot fix on the other hand might make more sense targeted at
master. The remaining instructions will assume `master` but it's important
to make sure your work is branched from an appropriate commit.

```text
$ git checkout -b feature-or-bug-fix
```

## Hack away

Make your changes, add tests and commit.

```text
$ git commit -am "fix the things"
```

## Pull upstream

Checkout `master` and pull in any upstream changes. You should not run
into any merge conflicts at this point since all work is being done on a
topic branch.

```text
$ git checkout master
$ git pull upstream master
```

## Rebase 

This is the fun bit. If there are conflicts between your branch and the
pulled in remote changes, you will need to merge them. Merging is
outside the scope of this post but it's a good idea to [rebase regularly](/images/rebase-no-conflict.jpg). 

```text
$ git checkout feature-or-bug-fix
$ git rebase master
```
 
## Push

Push the topic branch to your remote fork.

```text
$ git push origin feature-or-bug-fix
```

## Pull request

Submit the pull request. As noted above, be sure that you
target the appropriate branch &mdash; namely the one you branched from
originally.

## Grab yourself a nice bourbon rocks.
