# frozen_string_literal: true

require 'socket'

class CustomHTTPServer
  def initialize(port)
    @server = TCPServer.new(port) # Socket created and bound to port
  rescue => e
    puts "Cannot use this port: #{e.inspect}"
    exit
  end

  def run
    client = @server.accept # Socket to communicate with the client
    handle_request(client)
  rescue => e
    puts "Error occurred: #{e.inspect}"
  ensure
    client&.close
    puts "Connection closed!"
  end

  private

  def handle_request(client)
    request = client.gets
    http_method, url, _ = request.split

    if http_method == "GET"
      user_id = url.split("/").last
      response = "HTTP/1.0 200 Hey no. #{user_id}!"
    else
      response = "HTTP/1.0 400 No other method supported yet!"
    end
    client.puts response
  end
end

CustomHTTPServer.new(2000).run