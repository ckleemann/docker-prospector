# prospector docker image
[![Build Status](https://travis-ci.org/ckleemann/docker-prospector.svg?branch=master)](https://travis-ci.org/ckleemann/docker-prospector)

This docker image provides the latest version of [prospector](https://pypi.org/project/prospector/) with all dependencies e.g. ```prospector[with_everything]```. The prospector version is automatically updated and pushed to [docker hup](https://hub.docker.com/r/ckleemann/prospector).

## Gitlab CI
To use this image inside a gitlab ci environment add the following snippet to your ```.gitlab-ci.yml```: 

```yaml
prospector:
  image:
    name: ckleemann/prospector
    entrypoint: [""]
  before_script:
    - pip install -r requirements.txt
  script:
    - prospector --profile prospector.yml .
```
