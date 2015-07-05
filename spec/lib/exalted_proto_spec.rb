require "exalted_proto"

describe "Parses message and handles rolls" do
	describe "Exalted" do
		it "should detect lack of input" do
			expect(Exalted("!ex")).to eq("Nick: Human error.")
		end

		it "should detect lack of number in input" do
			expect(Exalted("!ex f10")).to eq("Nick: Human error.")
		end

		it "should for now detect a number in input" do
			expect(Exalted("!ex 10")).to eq("Nick: We shouldn't get here yet.")
		end

		it "should for now detect a number in input" do
			expect(Exalted("!exa 10")).to eq("Nick: Aren't you superstitious. We shouldn't get here yet.")
		end

		it "should for now detect a number in input" do
			expect(Exalted("!exm 10")).to eq("Nick: No kill. We shouldn't get here yet.")
		end

		it "should for now detect a number in input" do
			expect(Exalted("!exam 10")).to eq("Nick: Aren't you superstitious. No kill. We shouldn't get here yet.")
		end

		#it "should find a number and present false rolls" do
			#expect(Exalted("!ex 5")).to eq("Nick: 10 10 10 10 10")
		#end
	end
end