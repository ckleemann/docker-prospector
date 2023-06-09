FROM python:3.11.4

ARG VCS_REF
ARG VERSION
ARG BUILD_DATE

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.vcs-url="https://github.com/ckleemann/docker-prospector" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE

RUN groupadd prospector && useradd --no-log-init -r -g prospector prospector

COPY requirements.txt /tmp/requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip pip install --no-cache-dir --compile -r /tmp/requirements.txt

USER prospector

ENTRYPOINT ["/usr/local/bin/prospector"]
