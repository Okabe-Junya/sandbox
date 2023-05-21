require "socket"

class Server
  def initialize
    @server = TCPServer.new("localhost", 2000)
  end

  def run
    loop do
      Thread.start(@server.accept) do |client|
        loop do
          client.puts client.gets
        end
      end
    end
  end
end

Server.new.run
