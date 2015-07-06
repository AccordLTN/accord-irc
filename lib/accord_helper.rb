# Returns array of dice rolls
def roller(die, rep=1)
	return rep.times.map{1 + rand(die)}
end

# Returns true if illegal character found.
def check_character(arguement)
  arguement.each_char do |s|
    if !(s =~ /[d\d\+-\/*#]/)
      return true;
    end
  end
  return false;
end

# Returns true if illegal syntax found.
def check_arguement(arguement)
  # First character must be a number.
  if !(arguement[0] =~ /\d/)
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

# Break a string like "2#10d6+10/5-4*2" into [2, "#", 10, "d", 6 ...] etc
# Error handling better be handled -before- here pls
def parse_arguement (input_string)
  return input_string.split(/([d+\-*\/])/)
end

# This handles repeats and passes expressions onto the parser
def repeat_finder(string)
  string.each_char do |character|
    if character == "#"
      
      repeats = string[0..string.index(character)-1]
      rest_of_string = string[string.index(character)+1..string.length]
      
      parser(repeats, rest_of_string)
    end
  end
end 