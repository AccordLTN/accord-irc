# Returns array of dice rolls
def roller(die, rep=1)
	return rep.times.map{1 + rand(die)}
end

# Returns true if illegal character found.
def check_character(arguement)
  arguement.each_char do |s|
    if !(s =~ /[d\d\+-\/*]/)
      return true;
    end
  end
  return false;
end

# Returns true if illegal syntax found.
def check_arguement(arguement)
  # First character must be a number.
  if arguement[0] =~ /\D/
    return true;
  # Two operators in a row is detected.
  elsif arguement =~ /[d+\-*\/][d+\-*\/]/
    return true;
  # Illegal characters
  elsif check_character(arguement)
    return true;
  else
    return false;
  end
end

# Break a string like "10d6+10/5-4*2" into ["10", "d", "6" ...] etc
def parse_arguement (input_string)
  return input_string.split(/([d+\-*\/])/)
end

# This handles repeats and returns array of repeat count and the string - the repeat handler
def repeat_handler(string)
  repeats = 1
  rest_of_string = ""

  string.each_char do |character|
    if character == "#"      
      repeats = string[0..string.index(character)-1]
      rest_of_string = string[string.index(character)+1..string.length]
    end
  end

  return [repeats, rest_of_string]
end 

def sanitize_input(input)
  # Are there any arguements?
  if input.length < 2
    return "An arguement is required."
  end

  # Let's handle repeats first and get their operator out of the way
  # If it has a repeat operator
  # We need to access a global variable here... orz
  if input[1] =~ /\#/
    # That operator must be the first operator, else error.
    if input[1] =~ /^\d*\#/
      temp_array = repeat_handler(input[1])
      if temp_array[1] =~ /\#/
        return "Two repeat operators? Get out."
      end
      repetition = temp_array[0]
      input[1] = temp_array[1]
    else
      return "Improper repeat operator usage."
    end
  end


  # Are there illegal characters or syntax?
  if check_arguement(input[1])
    return "Illegal character(s) or syntax."
  end

  return false
end

# puts sanitize_input("!exa 10d6+10/5-4*2".split)
# puts sanitize_input("!exa 2#10d6+10/5-4*2".split)