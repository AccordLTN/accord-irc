def roller(die, rep=1)
	#return rep.times.map{die}
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

def execute (input)
	input = input.split

	# Are there any arguements, does it start with a digit, does it have illegal chars?
	if input.length < 2 || !(input[1][0] =~ /\d/) || check_character(input[1])
		return "Nick: Human error."
	end

	double_tens = true
	reply = "Nick: "
	rolls = []

	# This will trigger its own reply in the future, but do nothing else.
	if input[0] =~ /a/
		#reply += "Aren't you superstitious. "
	end

	# This will just not double tens in the success count, no reply.
	if input[0] =~ /m/
		#reply += "No kill. "
		double_tens = false
	end

	rolls = roller(10, input[1].to_i)
	ordered_rolls = rolls.sort.reverse
	#reply += "We shouldn't get here yet."

	return reply + ordered_rolls.join(', ') + "      " + rolls.to_s
end