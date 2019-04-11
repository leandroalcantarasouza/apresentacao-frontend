FROM node:10.15.3
# replace this with your application's default port
EXPOSE 8080
COPY . .
CMD ["npm","install"]
ENTRYPOINT ["npm","start"]
