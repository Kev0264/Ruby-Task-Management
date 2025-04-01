class HealthController < ApplicationController
  # skip_before_action :authenticate_user!

  def readiness
    checks = {
      database: database_alive?,
      redis: redis_alive?
    }
    
    status = checks.values.all? ? :ok : :service_unavailable
    render json: { status: status.to_s.upcase, checks: checks }, status: status
  end

  private
  
  def database_alive?
    ActiveRecord::Base.connection.execute('SELECT 1')
    true
  rescue
    false
  end
  
  def redis_alive?
    Sidekiq.redis(&:ping) == 'PONG'
  rescue
    false
  end
end
