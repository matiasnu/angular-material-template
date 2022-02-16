FROM node:16-alpine as build-step
LABEL author="Matias Nuñez "
WORKDIR /app

COPY . ./

RUN npm cache clear --force
RUN npm install
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=build-step /app/dist/angular-material-template /usr/share/nginx/html