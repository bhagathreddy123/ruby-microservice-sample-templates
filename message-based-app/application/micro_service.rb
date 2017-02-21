require 'bunny'
require_relative 'router'

class MicroService
  attr_reader :connection

  def initialize
    # @connection = Bunny.new("amqp://guest:guest@localhost:5672")
    @connection = Bunny.new
    start
    self
  end

  def start
    connection.start
  end

  def stop
    connection.stop
  end

  def channel
    @channel ||= connection.create_channel
  end

  def exchange
    @exchange ||= channel.topic("message_based_app", auto_delete: true)
  end

  def publish(payload, routing_key)
    exchange.publish(payload, routing_key: routing_key)
  end

  def subscribe(queue_name, routing_key)
    channel.queue(queue_name).bind(exchange, routing_key: routing_key, manual_ack: true).subscribe do |delivery_info, metadata, payload|
      res = Router.dispatch(queue_name, delivery_info, metadata, payload)
      puts ">>>>>>>> #{res.inspect} <<<<<<<<<<<"
    end
  end
end
