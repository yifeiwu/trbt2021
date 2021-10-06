# frozen_string_literal: true

require './lib/robot'

RSpec.describe Robot do
  describe 'Place and report' do
    it 'places the robot and reports its position' do
      bot = Robot.new(1, 1, 'NORTH')
      correct_response = [1, 1, 'NORTH']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it 'ignores facing case' do
      bot = Robot.new(1, 1, 'south')
      correct_response = [1, 1, 'SOUTH']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end

  describe 'bad initializations' do
    it 'ignores missing fields' do
      bot = Robot.new(1, 1, '')
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it 'ignores non-numeric coordinates numeric coordinates' do
      bot = Robot.new('blue', 1, 'NORTH')
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it 'ignores non-integer coordinates' do
      bot = Robot.new(1.5, 1, 'NORTH')
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it 'ignores out of table bounds placement' do
      bot = Robot.new(6, 1, 'NORTH')
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it 'ignore invalid facing' do
      bot = Robot.new(1, 1, 'green')
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end

  describe 'Move' do
    it 'moves robot forward' do
      bot = Robot.new(1, 1, 'NORTH')
      bot.move
      correct_response = [1, 2, 'NORTH']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it "doesn't move robot off board" do
      bot = Robot.new(1, 5, 'NORTH')
      bot.move
      correct_response = [1, 5, 'NORTH']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it "doesn't move robot off board" do
      bot = Robot.new(0, 0, 'SOUTH')
      bot.move
      correct_response = [0, 0, 'SOUTH']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
    it "doesn't move robot if uninitialized" do
      bot = Robot.new(1, '', 'SOUTH')
      bot.move
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end

  describe 'Left' do
    it 'turns robot counter-clockwise' do
      bot = Robot.new(1, 1, 'NORTH')
      bot.left
      correct_response = [1, 1, 'WEST']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
    it 'turns robot counter-clockwise twice loopsback' do
      bot = Robot.new(1, 1, 'NORTH')
      bot.left
      bot.left
      correct_response = [1, 1, 'SOUTH']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it 'ignores commands if uninitialized' do
      bot = Robot.new(1, 1)
      bot.left
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end

  describe 'Right' do
    it 'turns robot clockwise' do
      bot = Robot.new(1, 1, 'NORTH')
      bot.right
      correct_response = [1, 1, 'EAST']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
    it 'turns robot clockwise loops back' do
      bot = Robot.new(1, 1, 'WEST')
      bot.right
      bot.right
      correct_response = [1, 1, 'EAST']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end

    it 'ignores commands if uninitialized' do
      bot = Robot.new(1, 1)
      bot.right
      correct_response = nil
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end

  describe 'Place' do
    it 'places the robot' do
      bot = Robot.new
      bot.place(1, 1, 'EAST')
      correct_response = [1, 1, 'EAST']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
    it 'overrides current position if already placed' do
      bot = Robot.new(1, 1, 'WEST')
      bot.right
      bot.place(3, 3, 'SOUTH')
      correct_response = [3, 3, 'SOUTH']
      test_response = bot.report
      expect(test_response).to eq(correct_response)
    end
  end
end
