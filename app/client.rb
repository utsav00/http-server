# frozen_string_literal: true

require 'socket'

client = TCPSocket.new('localhost', 2000)

puts "Enter here:"

while (data = gets) do
  client.puts data
  puts client.gets
end

client.close
