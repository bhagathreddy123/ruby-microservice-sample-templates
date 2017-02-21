require_relative 'interface'

module ArithmeticProgression
  class << self
    include Interface

    def call(delivery_info, metadata, payload)
      arithmetic_progression(Integer(payload))
    end

    private

    def arithmetic_progression(num)
      num + 24
    end
  end
end
