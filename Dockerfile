FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .

RUN npm install
COPY . .

RUN npm run build
# CMD ["npm", "run", "build"]
# /app/build <<--- all files i need.

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
