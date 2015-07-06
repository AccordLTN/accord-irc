require "exalted_proto"

describe "Parses message and handles rolls" do
	describe "execute" do
		it "should detect lack of input" do
			expect(execute("!ex")).to eq("Nick: Human error.")
		end

		it "should detect lack of number in input" do
			expect(execute("!ex f10")).to eq("Nick: Human error.")
		end

		it "should find a number and present false rolls" do
			expect(execute("!ex 5")).to eq("Nick: [10, 10, 10, 10, 10]")
		end
	end
end






		#it "should for now detect a number in input" do
		#	expect(execute("!ex 10")).to eq("Nick: We shouldn't get here yet.")
		#end

		#it "should for now detect a number in input" do
		#	expect(execute("!exam 10")).to eq("Nick: Aren't you superstitious. No kill. We shouldn't get here yet.")
		#end