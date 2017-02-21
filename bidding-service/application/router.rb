require_relative 'handler_register'

module Router
  class << self
    def dispatch(request)
      klass = HandlerRegister.fetch(request.path_info)
      if request.get?
        klass.get(request.GET())
      elsif request.post?
        klass.post(JSON.parse(request.body.read))
      else
        raise NotImplementedError
      end
    end
  end
end
