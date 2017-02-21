require_relative 'interface'

module Fibonacci
  class << self
    include Interface

    def get(data)
      OpenStruct.new(body: fibonacci(Integer(data['num'])), status: 200)
    end

    private

    def fibonacci(n)
      n < 2 ? n : fibonacci(n-1) + fibonacci(n - 2)
    end
  end
end
