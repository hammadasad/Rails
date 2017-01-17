require 'socket'

host = 'localhost'
port = 2000

server = TCPServer.open(host, port)
puts "Server started on #{host}:#{port} ..."

loop do
  client = server.accept

  lines = []
  while(line = client.gets.chomp) && !line.empty?
  	lines << line
  end

  puts lines

  filename = line[0].gsub(/GET \//, '').gsub(/ HTTP.*/, '')

  #client.puts(Time.now.ctime)
  #client.puts "<h1>HEllo World</h1>"
  if File.exists?(filename)
  	response = File.read(filename)
  else
  	response = "File not found"
  end

  #response = File.read('index.html')
  client.puts response
  client.close
end