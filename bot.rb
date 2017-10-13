# Usar multhread ?
# to do: logger

module IrcBot

    require 'socket'
    require 'colorize'
    require 'yaml'
    require 'awesome_print'

    class Bot

        workers = YAML::load_file('bot.yml')
        ap workers

        def initialize(server, port, channels, nick)
            @server = server
            @port = port
            @channels = channels
            @nick = nick
        end
        
        def connect
            puts "connecting to server #{@server}:#{@port}...".yellow
            
            @socket = TCPSocket.new(@server, @port)
            puts "connected!".green
          
            @channels.each do |channel|
               send("NICK #{@nick}")
               send("USER #{@nick} 0 * #{@nick}")
               send("JOIN ##{channel}")

            end

            until @socket.eof? do
                puts @socket.gets
            end
        end


        def send(msg)
            puts msg.blue
            @socket.puts msg
        end

    end
end

channels = ['programmiersprache']

bot = IrcBot::Bot.new('irc.freenode.net', 6667, channels, 'AirBoat')
#bot.connect

