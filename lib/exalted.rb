class Exalted
  include Cinch::Plugin
  require "./lib/accord_helper.rb"
  #require "accord_helper" # doesn't work?
  #attr_accessor :math_array, :cosmetic_array, :repetition

  match /ex/

  def execute(m)
  	input = m.message.split
    response = "#{m.user.nick}: "
    math_array = []
    cosmetic_array = []
    repetition = 1
    double_tens = true
    auto_success = 0
    target_number = 7

    # Input sanitation and error checking
    sanitation = sanitize_input(input)
    if sanitation[0] != false
      m.reply response + sanitation[0]
      return 1
    end
    input[1] = sanitation[1]
    repetition = sanitation[2]
	
		# Parsing
    math_array = parse_arguement(input[1])
    cosmetic_array = math_array.deep_dup

    # Handle dice rolls if d operators exist
    if math_array.include?("d")
      rolls_handled = roll_handler(math_array, cosmetic_array)
      math_array = rolls_handled[0]
      cosmetic_array = rolls_handled[1]
    end

    # Handle math if */+- operators exist
    if math_array.include?("*") || math_array.include?("/") || math_array.include?("+") || math_array.include?("-")
      math_array = math_handler(math_array)
    end

    # Debugging
    # m.reply rolls_handled.to_s
    # m.reply response + cosmetic_array.join('') + " ---> " + math_array.join('')
    # m.reply response + math_array.join('')

    # Finally time for exalted specific things

    # !exm disables double_tens
    if input[0] =~ /m/
      double_tens = false
    end

    # !exs supplies a new target number, should be in input[2]
    if input[0] =~ /s/
      if input[2] =~ /^\d*$/
        target_number = input[2].to_i
      else
        m.reply response + "Improper use of !exs, please provide a number as the second arguement."
        return 1
      end
    end

    roll_array = roller(10, math_array[0])

    successes = success_count(roll_array, double_tens, auto_success, target_number)




  #   rolls = []

		# # Need to parse +'s and -'s
		# total_rolls = input[1].to_i

		
		# rolls = roller(10, total_rolls)
		# ordered_rolls = rolls.sort.reverse

		# # Add total rolls to response
		# response += "(" + total_rolls.to_s + ") "
		# # Add ordered rolls to response
		# response += ordered_rolls.join(', ') 
		# # Add unordered rolls to response
		# response += "      " + rolls.to_s
		
		# # Send response
		# m.reply response
	end

  def success_count (roll_array, double_tens, auto_success = 0,target_number = 7)

  end

end

# !exam 14+5-2 +2 Someday this will work