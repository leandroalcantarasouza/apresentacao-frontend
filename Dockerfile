FROM node:10.15.3 as node
# replace this with your application's default port
WORKDIR /usr/src/app
COPY . .
RUN npm install

FROM nginx:1.15.11
MAINTAINER Leandro Souza <leandro.alcantara.souza@gmail.com>
WORKDIR /usr/src/app
COPY --from=node /usr/src/app/public/ /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/
COPY nginx/default.conf /etc/nginx/conf.d/
EXPOSE 80
ENTRYPOINT exec nginx -g 'daemon off;'
