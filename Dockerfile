FROM node:alpine as builder
WORKDIR "/app"
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# EXPOSE 80 is being used to expose port 80 to the public cloud
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

