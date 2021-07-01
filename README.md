# prospector docker image
![Build Status](https://github.com/ckleemann/docker-prospector/workflows/ci/badge.svg)

This docker image provides the latest version of [prospector](https://pypi.org/project/prospector/) with all dependencies e.g. ```prospector[with_everything]```. The prospector version is automatically updated by dependabot and pushed to [docker hub](https://hub.docker.com/r/ckleemann/prospector).

## GitLab CI
To use this image inside a GitLab CI environment add the following snippet to your ```.gitlab-ci.yml```:

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
