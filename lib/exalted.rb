class Exalted
  include Cinch::Plugin
  require "./lib/accord_helper.rb"

  match /ex/

  def execute(m)
  	input = m.message.split
  	continue = true

  	if input.length < 2 || !(input[1][0] =~ /\d/) || check_character(input[1])
		m.reply "#{m.user.nick}: Human error."
		continue = false
	end

	if continue
		double_tens = true
		response = "#{m.user.nick}: "
		rolls = []

		# !exa triggers snark!
		if input[0] =~ /a/
			m.reply "Aren't you superstitious."
		end

		# !exm disables double_tens
		if input[0] =~ /m/
			double_tens = false
		end

		# Need to parse +'s and -'s
		total_rolls = input[1].to_i

		
		rolls = roller(10, total_rolls)
		ordered_rolls = rolls.sort.reverse

		# Add total rolls to response
		response += "(" + total_rolls.to_s + ") "
		# Add ordered rolls to response
		response += ordered_rolls.join(', ') 
		# Add unordered rolls to response
		response += "      " + rolls.to_s
		
		# Send response
		m.reply response
	end
  end

  # Break a string like "2#10d6+10/5-4*2" into [2, "#", 10, "d", 6 ...] etc
  def parse_arguement (input_string)

  end

  def success_count (roll_array, ten_bool, sidereal=10)

  end

end

# !exam 14+5-2 +2 Someday this will work