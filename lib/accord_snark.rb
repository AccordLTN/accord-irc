class AccordSnark
  include Cinch::Plugin

  match "botsnack", method: :snack_snark
  def snack_snark(m)
    m.reply "What does a machine need of treats?  I appreciate the offer, #{m.user.nick}, but you may keep them.  Your kindness has been noted."
  end

  match "botsmack", method: :smack_snark
  def smack_snark(m)
    m.reply "World 4EC59M found incongruent with expected parameters.  Sanitizing."
    m.reply "Here is the part where #{m.user.nick} would be kicked, but I don't know how to yet."
    m.reply "Sanitized."
  end
end