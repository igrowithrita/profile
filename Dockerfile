FROM nginx:alpine

# Use custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the Flutter web build
COPY build/web /usr/share/nginx/html
