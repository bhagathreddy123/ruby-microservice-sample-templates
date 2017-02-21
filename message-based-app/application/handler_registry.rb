class HandlerRegistry
  attr_reader :channel, :exchange, :store

  def initialize(channel, exchange)
    @channel = channel
    @exchange = exchange
    @store = {}
  end

  def register(queue_name)
    store[queue_name] ||= channel.queue(queue_name, auto_delete: true).bind(exchange)
  end

  def fetch(queue_name)
    store.fetch(queue_name)
  end
end
