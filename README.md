# Dockerfile of LLVM on alpine

![](https://github.com/capra314cabra/docker-llvm-alpine/workflows/Deploy%20LLVM%208.0.1/badge.svg)
![](https://github.com/capra314cabra/docker-llvm-alpine/workflows/Deploy%20LLVM%209.0.1/badge.svg)
![](https://github.com/capra314cabra/docker-llvm-alpine/workflows/Deploy%20LLVM%2010.0.0/badge.svg)

[DockerHub](https://hub.docker.com/r/capra314cabra/llvm-alpine) | [GitHub](https://github.com/capra314cabra/docker-llvm-alpine/actions)

This repo contains one dockerfile which just download sources from https://github.com/llvm/llvm-project and build them.  
If you want to use another version of LLVM, open issue to notify me. I would add it.

## Available versions

### LLVM 10.0.0 - Alpine 3.11

```bash
$ docker pull capra314cabra/llvm-alpine:10.0.0
```

### LLVM 9.0.1 - Alpine 3.11

```bash
$ docker pull capra314cabra/llvm-alpine:9.0.1
```

### LLVM 8.0.1 - Alpine 3.11

```bash
$ docker pull capra314cabra/llvm-alpine:8.0.1
```
