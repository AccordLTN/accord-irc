# I'm pretty aware that this is probably a bad way of doing this,
# but I felt like doing it like this for now :D

class IdentifyInfo
	attr_reader :password

	def initialize()
		@password = "Your Password Goes Here"
	end
end