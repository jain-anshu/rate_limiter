class RateLimiterKlass
    def initialize(app, options = {})
      @app = app
      @limit = options[:limit] || 100
      @window = options[:window] || 60.minutes
    end

    def call(env)
      request = Rack::Request.new(env)
      ip = request.ip
      key = "rate_limiter:#{ip}:#{Time.now.to_i / @window}"
      if Redis.current.get(key).to_i >= @limit
        [429, {}, ["Rate limit exceeded"]]
      else
        Redis.current.multi do
          Redis.current.incr(key)
          Redis.current.expire(key, @window)
        end
        @app.call(env)
      end 
    end

end