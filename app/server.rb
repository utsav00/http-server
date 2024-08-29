# frozen_string_literal: true

require 'socket'

server = TCPServer.new(2000) # Socket created and bound to port

client = server.accept # Socket to communicate with the client
client.puts "Sending something"
server.close
