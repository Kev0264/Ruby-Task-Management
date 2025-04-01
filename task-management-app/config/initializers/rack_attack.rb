# config/initializers/rack_attack.rb
class Rack::Attack
    # Use Redis for storing throttling counters if you're using Redis
    Rack::Attack.cache.store = ActiveSupport::Cache::RedisCacheStore.new(url: ENV['REDIS_URL'])
  
    # Throttle all requests by IP (300 requests per 5 minutes)
    throttle('req/ip', limit: 300, period: 5.minutes) do |req|
      req.ip unless req.path.start_with?('/assets')
    end
  
    # Throttle login attempts by IP (5 attempts per 20 seconds)
    throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
      if req.path == '/users/sign_in' && req.post?
        req.ip
      end
    end
  
    # Customize the response for throttled requests
    self.throttled_response = lambda do |env|
      retry_after = (env['rack.attack.match_data'] || {})[:period]
      [
        429,
        {
          'Content-Type' => 'application/json',
          'Retry-After' => retry_after.to_s
        },
        [{ error: "Too many requests. Please try again later." }.to_json]
      ]
    end
end

# Add this if you're using Rails (not required for plain Rack apps)
Rails.application.config.middleware.use Rack::Attack