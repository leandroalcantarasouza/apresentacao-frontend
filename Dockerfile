FROM node:10.15.3
# replace this with your application's default port
EXPOSE 3000
COPY . .
CMD ["npm","install"]
ENTRYPOINT ["npm","start"]
