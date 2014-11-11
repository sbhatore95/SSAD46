#!/usr/bin/ruby
counter = 1
i = File.match("**.epw", "/home/arushi/Downloads")
i.each do |line|
	while (line = file.gets)
	    puts "#{counter}: #{line}"
	    counter = counter + 1
	end
	file.close
end
