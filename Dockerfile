FROM python:3.8-alpine
MAINTAINER prashant

ENV PYTHONUNBUFFERED 1
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN mkdir /app
WORKDIR /app
COPY ./app /app
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chmod -R 755  /vol/web
USER root
RUN apk add memcached
USER user
