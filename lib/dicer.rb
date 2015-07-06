class Dicer
  include Cinch::Plugin
  require "./lib/accord_helper.rb"

  match /roll\s/

  def execute(m)
    m.reply "#{m.user.nick}: " + roller(20).to_s
  end
end