FROM python:3.10.0b3

ARG VCS_REF
ARG VERSION
ARG BUILD_DATE

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.vcs-url="https://github.com/ckleemann/docker-prospector" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version=$VERSION \
      org.label-schema.build-date=$BUILD_DATE

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --compile -r /tmp/requirements.txt

ENTRYPOINT ["/usr/local/bin/prospector"]
