require_relative 'interface'

module Reverse
  class << self
    include Interface

    def get(data)
      OpenStruct.new(body: reverse(data['str']), status: 200)
    end

    private

    def reverse(str)
      str.reverse
    end
  end
end
