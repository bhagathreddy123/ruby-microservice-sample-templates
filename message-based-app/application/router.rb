require_relative '../handlers/arithmetic_progression'
require_relative '../handlers/geometric_progression'
require_relative '../handlers/hcf_with_1024'

module Router
  class << self
    def dispatch(queue_name, delivery_info, metadata, payload)
      register.fetch(queue_name).call(delivery_info, metadata, payload)
    end

    private

    def register
      {
        "arithmetic_progression" => ArithmeticProgression,
        "geometric_progression" => GeometricProgression,
        "hcf_with_1024" => HcfWith1024
      }
    end
  end
end
