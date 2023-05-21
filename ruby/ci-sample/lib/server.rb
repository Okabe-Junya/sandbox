require "socket"

class Server
  def initialize(port:, host:)
    @port = port
    @host = host
    @server = TCPServer.new(@host, @port)
  end

  def run
    puts "Server started"
    loop do
        client = @server.accept
        client.puts "Hello Ruby"
        client.close
    end
  end
end

Server.new(port: 2000, host: "localhost").run
