FROM node:18-alpine AS base

WORKDIR /app
RUN npm i -g pnpm

FROM base AS build

WORKDIR /app

COPY pnpm-lock.yaml ./
RUN pnpm fetch

COPY . .
RUN pnpm i --offline
RUN pnpm run build

FROM nginx:1.18-alpine AS deploy

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=build /app/dist .
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]