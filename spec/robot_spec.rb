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
    it "has missing fields" do
      bot = Robot.new(1,1,'')
      correct_response=nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it "doesn't place the robot within numeric coordinates" do
      bot = Robot.new('blue',1,'north')
      correct_response=nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it "doesn't place the robot within integer coordinates" do
      bot = Robot.new(1.5,1,'north')
      correct_response=nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it "doesn't place the robot within table bounds" do
      bot = Robot.new(6,1,'north')
      correct_response=nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it "doesn't place robot with valid facing" do
      bot = Robot.new(1,1,'green')
      correct_response=nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end




end