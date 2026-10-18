FROM node:24-slim AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .

FROM gcr.io/distroless/nodejs24-debian13:nonroot
WORKDIR /app
COPY --from=build /app .
ARG VERSION=dev
ENV NODE_ENV=production APP_VERSION=$VERSION
CMD ["index.js"]
