require "socket"

class Client
  def initialize(port:, host:)
    @port = port
    @host = host
  end

  def run
    puts "Client started"
    socket = TCPSocket.new(@host, @port)
    puts socket.gets
    socket.close
  end
end

Client.new(port: 2000, host: "localhost").run
