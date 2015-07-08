require "./lib/accord_helper.rb"

# def roller(die, rep=1)
# 	# Debugging, just returns max die:
# 	# return rep.times.map{die}

# 	# The real roller:
# 	return rep.times.map{1 + rand(die)}
# end

def execute (input)
	input = input.split
  response = "Lauras: "
  repetition = 1

  sanitation = sanitize_input(input)
  if sanitation != false
    return response + sanitation
  end

 	double_tens = true
	rolls = []

	# This will trigger its own reply in the future, but do nothing else.
	if input[0] =~ /a/
		#reply += "Aren't you superstitious. "
	end

	# This will just not double tens in the success count, no reply.
	if input[0] =~ /m/
		double_tens = false
	end

	# Handle dice rolls

	# Input isn't properly parsed yet
	rolls = roller(10, input[1].to_i)
	ordered_rolls = rolls.sort.reverse

	return response + ordered_rolls.join(', ') + "      " + rolls.to_s
end