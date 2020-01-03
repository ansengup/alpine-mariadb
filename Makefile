NS ?= ansengup
VERSION ?= rpi
IMAGE_NAME ?= mariadb
ARCH := $(shell arch)

ifneq ($(ARCH),i386)
  DOCKERFILE ?= Dockerfile
else 
  DOCKERFILE ?= Dockerfile.i386
endif 

include docker_defs.mk

