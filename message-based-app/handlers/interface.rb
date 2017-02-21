module Interface
  class << self
    def call(delivery_info, metadata, payload); raise NotImplementedError; end
  end
end
