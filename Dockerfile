FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

CMD ["npm", "run", "build"]

############# builder stage ################
############# 여기까지는 build 파일 만들기 ################

FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html


############# run stage ################
############# 여기까지는 ningux 실행 ################