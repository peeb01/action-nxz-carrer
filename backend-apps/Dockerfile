FROM node:22.13.1-alpine AS builder

WORKDIR /opt/app
COPY package.json package-lock.json ./

RUN npm install
COPY . .
RUN npm run build

FROM node:22.13.1-alpine

WORKDIR /opt/app
COPY --from=builder /opt/app /opt/app

EXPOSE 3000
CMD ["npm", "run", "start"]

# build as -> pib21/nxz-node-app:v1


