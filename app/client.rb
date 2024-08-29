# frozen_string_literal: true

require 'socket'

class Client
  def initialize(host, port)
    @client = TCPSocket.new(host, port)
  rescue StandardError => e
    puts "Failed to connect to server: #{e.message}"
    exit
  end

  def send_request(request)
    @client.puts request
    response = @client.gets
    puts response
  rescue StandardError => e
    puts "Error occurred: #{e.inspect}"
  ensure
    @client&.close
    puts "Connection closed!"
  end
end


request = "GET /users/5 HTTP/1.0\r\n"
Client.new('localhost', 2000).send_request(request)
