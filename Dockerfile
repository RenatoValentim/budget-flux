FROM node:22-alpine

WORKDIR /app

COPY ./api/package*.json ./
COPY ./api/prisma ./prisma/
COPY ./api/tsconfig.build.json ./
COPY ./api/tsconfig.json ./

RUN npm install

RUN npx prisma generate

COPY . .

RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "start:prod" ]

