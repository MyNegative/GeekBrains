FROM python:3.8.8
LABEL maintainer="name"
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
EXPOSE 8181
EXPOSE 8180
VOLUME /app/app
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]