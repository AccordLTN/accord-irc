class Dicer
  include Cinch::Plugin
  require "./lib/roll_helper.rb"

  match /roll\s/

  def execute(m)
    m.reply "#{m.user.nick}: " + roller(20).to_s
  end
end