require 'cinch'
require 'cinch/plugins/identify'
require './lib/accord_snark.rb'
require './lib/exalted.rb'
require './lib/dicer.rb'
require './cfg/identify_info.rb'


identify = IdentifyInfo.new

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.rizon.net"
    c.channels = ["#fuuuuuuuuuuu"]
    c.nicks = ["Accord", "Accords"]
    c.realname = "Accord"
    c.user = "Accord"
    c.plugins.plugins = [AccordSnark, Dicer, Exalted, Cinch::Plugins::Identify]
    c.plugins.options[Cinch::Plugins::Identify] = {
      :password => identify.password,
      :type     => :nickserv,
    }
  end
end

bot.start