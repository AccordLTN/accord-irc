require "spec_helper"
require "accord_helper"

# describe "roller"  do
#   it "should roll a die 1d10" do
#     expect(roller(10,1).length).to eq(1)
#   end

#   it "should roll a die once if given no repeat #" do
#     expect(roller(10).length).to eq(1)
#   end

#   it "should handle rolling an absurd number of die just fine" do
#     expect(roller(20, 4320).length).to eq(4320)
#   end
# end

# describe "check_character" do
#   it "should return false if given proper input" do
#     expect(check_character("210d6+10/5-4*2")).to eq(false)
#     expect(check_character("374*/+-d43")).to eq(false)
#   end

#   it "should return true if given anything but 0-9, +, -, *, /, d" do
#     expect(check_character("2#10d6+10/5-4*2")).to eq(true)
#     expect(check_character("deltree c: /y")).to eq(true)
#   end
# end

# describe "check_argument" do
#   it "should return false if given proper input" do
#     expect(check_argument("10d6+10/5-4*2")).to eq(false)
#   end

#   it "should return true if the first character isn't a number" do
#     expect(check_argument("a10d6+10")).to eq(true)
#     expect(check_argument("+6+10")).to eq(true)
#   end
# end

# describe "sanitize_input" do
#   it "should return false if given proper input" do
#     expect(sanitize_input("!ex 10d6+10/5-4*2".split)).to eq(false)
#     expect(sanitize_input("!ex 2#10d6+10/5-4*2".split)).to eq(false)
#   end

#   it "should complain if no arguments are given" do
#     expect(sanitize_input("!ex".split)).to eq("An argument is required.")
#   end

#   it "should find bad repeat usage" do
#     expect(sanitize_input("!ex 2#10d6+10/5-4*2#4".split)).to eq("Two repeat operators? Get out.")
#     expect(sanitize_input("!ex 2*10d6+10/5-4*2#4".split)).to eq("Improper repeat operator usage.")
#   end

#   it "should find illegal characters or syntax" do
#     expect(sanitize_input("!ex 2*10dabd6+10/5-4*24".split)).to eq("Illegal character(s) or syntax.")
#     expect(sanitize_input("!ex 2*10dd6+10/5-4*24".split)).to eq("Illegal character(s) or syntax.")
#   end
# end


describe "roll_handler" do
  it "should do stuff" do
    expect(roll_handler(["10", "d", "6", "+", "10", "/", "5", "-", "4", "*", "2"],["10", "d", "6", "+", "10", "/", "5", "-", "4", "*", "2"])).to 
  end
end