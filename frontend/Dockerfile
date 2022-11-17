FROM node:14.18.1
RUN apt-get update && apt-get install nginx -y
WORKDIR app
COPY frontend .
RUN yarn install
RUN yarn build
RUN cp -r build/* /usr/share/nginx/html/
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
