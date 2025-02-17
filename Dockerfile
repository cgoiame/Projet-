FROM node:14.19.0

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY . .

RUN npm install --legacy-peer-deps
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source

EXPOSE 5000
#RUN mv .env.example .env && npm run seed
CMD [ "npm", "run", "server:prod" ]