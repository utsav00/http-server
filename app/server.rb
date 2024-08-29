# frozen_string_literal: true

require 'socket'

begin
  server = TCPServer.new(2000) # Socket created and bound to port

  client = server.accept # Socket to communicate with the client

  request = client.gets
  http_method, url, _ = request.split

  if http_method == "GET"
    user_id = url.split("/").last
    response = "HTTP/1.0 200 Hey no. #{user_id}!"
    client.puts response
  end

rescue => e
  puts "Error occurred: #{e.inspect}"
ensure
  client&.close
  server&.close
  puts "Connection closed!"
end