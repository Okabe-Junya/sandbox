require "socket"

class Client
  def initialize
    @client = TCPSocket.new("localhost", 2000)
  end

  def run
    loop do
      puts "Enter a message to send to the server:"
      message = gets.chomp
      if message == "quit"
        @client.close
        break
      else
        @client.puts message
        puts @client.gets
      end

      if @client.closed?
        puts "Connection closed"
        break
      end
    end
  end
end

Client.new.run
