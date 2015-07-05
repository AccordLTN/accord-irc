def roller(die, rep=1)
	return rep.times.map{10}
end

def Exalted (message)
	message = message.split

	if message.length < 2 || !(message[1][0] =~ /\d/) || message[1] =~ /[a-z]/
		return "Nick: Human error."
	end

	double_tens = true
	reply = "Nick: "

	if message[0] =~ /a/
		reply += "Aren't you superstitious. "
	end

	if message[0] =~ /m/
		reply += "No kill. "
		double_tens = false
	end
	
	reply += "We shouldn't get here yet."

	return reply
end