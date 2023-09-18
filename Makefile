SHELL = /bin/bash

UNAME = $(shell uname)

# Some directories
SUPER_DIR   = $(shell basename `pwd`)

ARCH = $(shell uname -m)

DATES = $(shell date +%s)

# Git stuff management
HAS_GITFLOW      = $(shell git flow version 2>/dev/null || [ $$? -eq 0 ])
LAST_TAG_COMMIT = $(shell git rev-list --tags --max-count=1)
LAST_TAG = $(shell git describe --tags $(LAST_TAG_COMMIT) )
TAG_PREFIX = "v"


CURRENT_BRANCH          = $(shell git rev-parse --abbrev-ref HEAD)
GIT_BRANCHES            = $(shell git for-each-ref --format='%(refname:short)' refs/heads/ | xargs echo)
GIT_REMOTES             = $(shell git remote | xargs echo )
GIT_ROOTDIR             = $(shell git rev-parse --show-toplevel)
GIT_URL 				= $(shell git config --get remote.origin.url)

COMMIT_ID = $(shell git rev-parse --short HEAD)
COMMIT_MSG =$(shell git log -1 --pretty=%B | cat )

REG_URI = chankx/bunwhoami


build:
	docker build --platform linux/amd64 -t $(REG_URI):$(COMMIT_ID) .
push:
	docker push $(REG_URI):$(COMMIT_ID)
latest:
	docker tag $(REG_URI):$(COMMIT_ID) $(REG_URI):latest
	docker push $(REG_URI):latest

build-latest: build push latest