# Use official Redis Alpine image
FROM redis:7-alpine

# Copy custom Redis configuration
COPY redis.conf /usr/local/etc/redis/redis.conf

# Create directory for persistent data
RUN mkdir -p /data && chown redis:redis /data

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD redis-cli ping | grep PONG

# Start Redis with configuration
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

# Expose Redis port
EXPOSE 6379