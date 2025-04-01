# Use official PostgreSQL Alpine image
FROM postgres:15-alpine

# Set environment variables
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=your_secure_password
ENV POSTGRES_DB=task_manager_development

# Copy initialization scripts
COPY init.sql /docker-entrypoint-initdb.d/

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD pg_isready -U $POSTGRES_USER -d $POSTGRES_DB

# Expose PostgreSQL port
EXPOSE 5432