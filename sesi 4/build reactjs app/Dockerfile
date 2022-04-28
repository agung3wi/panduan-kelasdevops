FROM node:14-alpine3.15 AS build
WORKDIR /app
COPY . /app/
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html