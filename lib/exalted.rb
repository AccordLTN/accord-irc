class Exalted
  include Cinch::Plugin
  require "./lib/roll_helper.rb"

  match /ex/

  def execute(m)
  	rep = 10
  	rolled = roller(10, rep).to_s
  	rolled = m.message.slice[3..-1]
    m.reply "#{m.user.nick}: " + rolled
  end
end