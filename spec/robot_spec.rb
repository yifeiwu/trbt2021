require './lib/robot'

RSpec.describe Robot do
  describe "Place and report" do
    it "places the robot and reports its position" do
      bot = Robot.new(1,1,'north')
      correct_response=[1,1,'north']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end

  describe "Faulty initialization" do
    it "doesn't properly place the robot" do
      bot = Robot.new(1,1,'')
      correct_response=nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end



end