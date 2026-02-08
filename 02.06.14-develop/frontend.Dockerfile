FROM node:25.6.0 AS builder

WORKDIR /virtualpets-client-js

COPY . .

RUN --mount=type=cache,target=/root/.npm npm install

RUN npm run build-development-springboot

FROM nginx:1.29.4-alpine3.23

COPY --from=builder /virtualpets-client-js/dist /usr/share/nginx/html

COPY src /virtualpets-client-js/src



