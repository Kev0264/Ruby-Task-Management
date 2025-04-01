# Use official NGINX Alpine image
FROM nginx:1.23-alpine

# Remove default configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom NGINX configuration
COPY config/nginx.conf /etc/nginx/conf.d/rails_app.conf

# Copy SSL certificates (if using HTTPS)
# COPY ssl/ /etc/nginx/ssl/

# Create directory for PID file
RUN mkdir -p /var/run/nginx

# Expose ports
EXPOSE 80
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]