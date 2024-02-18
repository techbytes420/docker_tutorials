FROM node:14

WORKDIR /var/www

COPY package.* .

RUN npm i

COPY . .

CMD [ "npm", "run" , "dev" ]
