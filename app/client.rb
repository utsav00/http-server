# frozen_string_literal: true

require 'socket'

begin
  client = TCPSocket.new('localhost', 2000)

  request = "GET /users/5 HTTP/1.0\r\n"

  client.puts request
  puts client.gets

rescue => e
  puts "Error occurred: #{e.inspect}"
ensure
  client&.close
  puts "Connection closed!"
end
