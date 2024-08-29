# frozen_string_literal: true

require 'socket'

begin
  client = TCPSocket.new('localhost', 2000)

  puts "Enter here:"
  until (data = gets.chomp).empty? do
    client.puts data
    puts client.gets
  end

rescue => e
  puts "Error occurred: #{e.inspect}"
ensure
  client&.close
  puts "Connection closed!"
end
