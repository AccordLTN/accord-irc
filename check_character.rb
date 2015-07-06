def check_character(arguement)
	arguement.each_char do |s|
		if !(s =~ /[\d+-\/*#]/)
			return false;
		end
	end
	return true;
end

puts check_character("meow")
puts check_character("meow1")
puts check_character("4")
puts check_character("4+5")
puts check_character("/")
puts check_character("+")
puts check_character("-")
puts check_character("*")