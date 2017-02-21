require_relative '../handlers/fibonacci'
require_relative '../handlers/reverse'

module HandlerRegister
  class << self
    def fetch(path)
      register.fetch(path.gsub('/', ''))
    end

    private

    def register
      {
        'fibonacci' => Fibonacci,
        'reverse' => Reverse
      }
    end
  end
end
