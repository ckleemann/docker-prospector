FROM python:3.12.4-bullseye

ARG VCS_REF
ARG VERSION
ARG BUILD_DATE
ARG DEBIAN_FRONTEND=noninteractive

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.vcs-url="https://github.com/ckleemann/docker-prospector" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE

RUN groupadd prospector && useradd --no-log-init -r -g prospector prospector

RUN apt-get update && apt-get dist-upgrade -y

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --compile -r /tmp/requirements.txt

USER prospector

ENTRYPOINT ["/usr/local/bin/prospector"]
