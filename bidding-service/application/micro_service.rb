require_relative 'router'

module MicroService
  class << self
    def call(env)
      service_response = Router.dispatch(Rack::Request.new(env))
      response = Rack::Response.new
      response.body = Array(String(service_response.body))
      response['X-Custom-Header'] = 'foo'
      response.status = service_response.status
      response.finish
    end
  end
end
