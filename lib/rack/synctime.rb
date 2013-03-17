module Rack

  class Synctime

    DEFAULT_HEADER_NAME = "X-Synced-At"

    def initialize(app, header_name = DEFAULT_HEADER_NAME, time_offset = 0)
      @app = app
      @synced_at_header_name = header_name
      @time_offset = time_offset
    end

    def call(env)
      now = current_time_with_offset
      resp = @app.call(env)
      resp[1][@synced_at_header_name] = now.to_s
      resp
    end

    def current_time_with_offset
      Time.now.to_i + @time_offset
    end

  end

end
