# This is how you can put a name on a step. This is the "builder" step
# Step 1
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Start step 2
# Each step can only have one FROM
FROM nginx
# The last path is from the nginx docker hub documentation
COPY --from=builder /app/dist /usr/share/nginx/html