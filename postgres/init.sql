-- Create additional users if needed
-- CREATE USER app_user WITH PASSWORD 'app_password';
-- GRANT ALL PRIVILEGES ON DATABASE task_manager_development TO app_user;

-- Create extensions
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gin;