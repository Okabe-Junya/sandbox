require_relative "../lib/client"
require_relative "../lib/server"

RSpec.describe Server do
  before(:each) do
    @server = Server.new(port: 20000, host: "localhost")
    @client = Client.new(port: 20000, host: "localhost")
    @server_thread = Thread.new { @server.run }
  end

  after(:each) do
    @server_thread.kill
  end

  it "should send a message to the client" do
    expect(@client.run).to eq(nil)
  end
end
