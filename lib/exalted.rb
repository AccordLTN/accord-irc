class Exalted
  include Cinch::Plugin
  require "./lib/accord_helper.rb"
  #require "accord_helper" # doesn't work?
  #attr_accessor :@math_array, :@cosmetic_array, :@repetition

  def initializest
    @input = []
    @response = ""
    @math_array = []
    @cosmetic_array = []
    @repetition = 1
    @double_tens = true
    @auto_success = 0
    @target_number = 7
    @double_custom = false
  end

  match /ex/, method: :execute
  def execute(m)
    # Reset all values
    initializest()
    @input = m.message.split
    @response = "#{m.user.nick}: "

    # @input sanitation and error checking
    sanitation = sanitize_input(@input)
    if sanitation[0] != false
      m.reply @response + sanitation
      return 1
    end
    @input[1] = sanitation[1]
    @repetition = sanitation[2]
	
		# Parsing
    @math_array = parse_argument(@input[1])
    @cosmetic_array = @math_array.deep_dup

    # Handle dice rolls if d operators exist
    if @math_array.include?("d")
      rolls_handled = roll_handler(@math_array, @cosmetic_array)
      @math_array = rolls_handled[0]
      @cosmetic_array = rolls_handled[1]
    end

    # Handle math if */+- operators exist
    if @math_array.include?("*") || @math_array.include?("/") || @math_array.include?("+") || @math_array.include?("-")
      @math_array = math_handler(@math_array)
    end

    # Handle extra commands  
    # This is being done a bit late, perhaps move it earlier by separating it from @response.
    temp = modes_handler()
    if temp == 1
      m.reply @response
      return 1
    end

    # Performing Exalted rolls
    roll_array = roller(10, @math_array[0].to_i)

    # Totalling successes
    successes = success_count(roll_array)

    # Add ordered array to @response
    @response += roll_array.sort.reverse.join(', ')

    # Add successes to @response
    if successes > 0
      @response += "    Successes: " + successes.to_s
    else
      @response += "  Botch."
    end

    # Add unordered array to @response
    @response += "        " + roll_array.to_s

    # Send that @response!
    m.reply @response
	end

  def modes_handler
    # !exm disables @double_tens
    if @input[0] =~ /m/
      @double_tens = false
    end

    # !exd adds another number that grants double successes
    if @input[0] =~ /d/
      if @input[2] =~ /^\d*$/
        @double_custom = @input[2].to_i
      else
        @response += "Improper use of !exd, please provide a target number as the second argument."
        return 1
      end
    end

    # !exs supplies a new target number, should be in @input[2] or @input[3] if !exd is enabled
    if @input[0] =~ /s/ && @double_custom != false
      if @input[3] =~ /^\d*$/
        @target_number = @input[3].to_i
      else
        @response += "Improper use of !exds, please provide a double number as the second argument and a target number as the third argument."
        return 1
      end
    elsif @input[0] =~ /s/
      if @input[2] =~ /^\d*$/
        @target_number = @input[2].to_i
      else
        @response += "Improper use of !exs, please provide a target number as the second argument."
        return 1
      end
    end

    # Were there any auto-successes/penalties?
    @input.each do |x|
      @auto_success += x.to_i if x =~ /^[\+\-]\d*$/
    end

    # Assignments and syntax checking done, time to add to response.
    # Add total rolls to @response
    @response += "(" + @math_array[0].to_s + ") "
    @response += "(M) " if !@double_tens
    @response += "(D" + @double_custom.to_s + ") " if @double_custom != false
    @response += "(S" + @target_number.to_s + ") " if @target_number != 7
    @response += "(A+" + @auto_success.to_s + ") " if @auto_success > 0
    @response += "(A" + @auto_success.to_s + ") " if @auto_success < 0
  end

  def success_count (roll_array)
    successes = @auto_success
    @double_custom = 10 if @double_custom == false

    roll_array.each do |x|
      if x.to_i >= @double_custom && @double_tens
        successes += 2
      elsif x.to_i >= @target_number
        successes += 1
      end
    end
    return successes
  end
end

# !exam 14+5-2 +2 Someday this will work
# Haha, much more than this works now xD