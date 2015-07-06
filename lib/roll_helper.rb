def roller(die, rep=1)
	return rep.times.map{1 + rand(die)}
end

# Returns true if illegal character found.
def check_character(arguement)
	arguement.each_char do |s|
		if !(s =~ /[\d+-\/*#]/)
			return true;
		end
	end
	return false;
end