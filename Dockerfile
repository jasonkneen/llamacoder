# Stage 1: Build the application
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Create the final image
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app ./
RUN npm ci --only=production

EXPOSE 3000

CMD ["npm", "start"]
