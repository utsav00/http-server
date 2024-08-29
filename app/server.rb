# frozen_string_literal: true

require 'socket'

begin
  server = TCPServer.new(2000) # Socket created and bound to port

  client = server.accept # Socket to communicate with the client

  while (data = client.gets) do
    client.puts data
    pp data.chomp
  end

rescue => e
  puts "Error occurred: #{e.inspect}"
ensure
  client&.close
  server&.close
  puts "Connection closed!"
end