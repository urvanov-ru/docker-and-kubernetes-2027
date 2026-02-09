FROM node:25.6.0 AS builder

WORKDIR /virtualpets-client-js

COPY package*.json ./

RUN --mount=type=cache,target=/root/.npm npm install

COPY . .

RUN npm run build-development-springboot

FROM nginx:1.29.4-alpine3.23

COPY --from=builder /virtualpets-client-js/dist /usr/share/nginx/html




