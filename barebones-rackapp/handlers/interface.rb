module Interface
  class << self
    def get(data); raise NotImplementedError; end
    def post; raise NotImplementedError; end
  end
end
