require_relative '../handlers/bid'

module HandlerRegister
  class << self
    def fetch(path)
      register.fetch(path.gsub('/', ''))
    end

    private

    def register
      {
        'bid' => Bid
      }
    end
  end
end
