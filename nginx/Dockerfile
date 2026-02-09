
FROM nginx:latest


RUN apt-get update && \
    apt-get install -y iputils-ping curl && \
    apt-get clean


RUN rm /etc/nginx/nginx.conf


COPY nginx.conf /etc/nginx/nginx.conf
