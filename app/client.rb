# frozen_string_literal: true

require 'socket'

client = TCPSocket.new('localhost', 2000)

puts client.gets
client.puts "Hello from the client"

client.close
