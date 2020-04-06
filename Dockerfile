# ----build phase
FROM node:alpine as builder

# 'as' is a tag that can be referred to later
WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build <--- will contain all of our stuff from this build phase

# --Run phase
FROM nginx
EXPOSE 80
# /usr/share/nginx/html <-- the equivalent of wwwroot in nginx
COPY --from=builder /app/build /usr/share/nginx/html