class Dicer
  include Cinch::Plugin
  require "./lib/accord_helper.rb"

  # def initializest
  #   @repetition = 1
  # end

  match /roll\s/, method: :execute
  def execute(m)
    input = m.message.split
    response = "#{m.user.nick}: "
    math_array = []
    cosmetic_array = []
    repetition = 1
    
    # Input sanitation and error checking
    sanitation = sanitize_input(input)
    if sanitation[0] != false
      m.reply response + sanitation
      return 1
    end
    input[1] = sanitation[1]
    repetition = sanitation[2]
  
    # Parsing
    parsed_array = parse_argument(input[1])

    # Preparation
    complete_response = ''
    result_array = []

    repeats = 1
    while repeats <= repetition do
      # Empty out the repeat_response from last repeat.
      repeat_response = ''
      repeat_response += ',  ' if repeats > 1

      # Make our arrays, deep_dups so that future repeats don't have issues.
      math_array = parsed_array.deep_dup
      cosmetic_array = parsed_array.deep_dup

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

      # If there are repeats, label each roll with its number
      if repetition > 1
        repeat_response += repeats.to_s + ": "
      end
      
      # Slap on the cosmetic array and prettyness, then the math_array, which should be just one number
      repeat_response += "" + cosmetic_array.join('') + "  {" + math_array.join('') + "}"

      # Send that response!
      complete_response += repeat_response
      

      # Add to results array
      result_array << math_array[0]
      repeats += 1
    end
    # Send that response!
    m.reply response + complete_response

    # Result summary
    if repetition > 1
      m.reply response + result_array.join(", ")
    end
  end
end




  # def execute(m)
  #   input = m.message.split
  #   response = "#{m.user.nick}: "
  #   math_array = []
  #   cosmetic_array = []
  #   repetition = 1
    
  #   # Input sanitation and error checking
  #   sanitation = sanitize_input(input)
  #   if sanitation[0] != false
  #     m.reply response + sanitation
  #     return 1
  #   end
  #   input[1] = sanitation[1]
  #   repetition = sanitation[2]
  
  #   # Parsing
  #   parsed_array = parse_argument(input[1])

  #   repeats = 1
  #   while repeats <= repetition do
  #     # Empty out the repeat_response from last repeat.
  #     repeat_response = ''

  #     # Make our arrays, deep_dups so that future repeats don't have issues.
  #     math_array = parsed_array.deep_dup
  #     cosmetic_array = parsed_array.deep_dup

  #     # Handle dice rolls if d operators exist
  #     if math_array.include?("d")
  #       rolls_handled = roll_handler(math_array, cosmetic_array)
  #       math_array = rolls_handled[0]
  #       cosmetic_array = rolls_handled[1]
  #     end

  #     # Handle math if */+- operators exist
  #     if math_array.include?("*") || math_array.include?("/") || math_array.include?("+") || math_array.include?("-")
  #       math_array = math_handler(math_array)
  #     end

  #     # If there are repeats, label each roll with its number
  #     if repetition > 1
  #       repeat_response += repeats.to_s + ": "
  #     end
      
  #     # Slap on the cosmetic array and prettyness, then the math_array, which should be just one number
  #     repeat_response += cosmetic_array.join('') + " ----> " + math_array.join('')

  #     # Send that response!
  #     m.reply response + repeat_response
  #     repeats += 1
  #   end