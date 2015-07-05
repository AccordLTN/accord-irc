require "spec_helper"
require "roll_helper"

describe "Helps with rolls"
	describe "roller"  do
		it "should roll a die 1d10" do
			expect(roller(10,1).length).to eq(1)
		end

		it "should roll a die once if given no repeat #" do
			expect(roller(10).length).to eq(1)
		end

		it "should handle rolling an absurd number of die just fine" do
			expect(roller(20, 4320).length).to eq(4320)
		end
	end