# file = File.open("log.txt", "r")
# puts file.read
# file.close

# File.open("log.txt", "r") do |f|
# 	puts f.read
# end

File.open("log.txt", "r").each_line do |line|
	puts line
end