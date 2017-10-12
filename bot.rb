require  'socket'

puts 'connecting...'
#socket = TCPSocket.new('chat.freenode.net', 8001)
socket = TCPSocket.new('irc.freenode.net', 6667)

socket.puts 'NICK oblivion3'
socket.puts 'USER oblivion3 0 * oblivion'
socket.puts 'JOIN #programmiersprache'

running = true

puts 'connected!'

until socket.eof? do
    puts socket.gets
end


#while(running) do
#    ready = IO.select([socket])
#
#    ready[0].each do |s|
#        line = s.gets
#        puts s.gets
#    end
#
#end
#
puts 'Exited :('


