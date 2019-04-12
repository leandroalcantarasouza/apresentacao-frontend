FROM node:10.15.3
# replace this with your application's default port
EXPOSE 3000
COPY . .
ARG BACKEND_URI_PARAMETER
ENV BACKEND_URI=$BACKEND_URI_PARAMETER
ENV BACKEND_PORT=8080
CMD ["npm","install"]
ENTRYPOINT ["npm","start"]
