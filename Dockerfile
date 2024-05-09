## For Frontend 

FROM node:iron-alpine as build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine3.19-perl
COPY --from=build /app/build /usr/share/nginx/html