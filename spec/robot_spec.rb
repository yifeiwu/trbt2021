# frozen_string_literal: true

require './lib/robot'

RSpec.describe Robot do
  let(:robot) { Robot.new }
  let(:test_response) { robot.report }
  describe '#place' do
    describe 'valid placements' do
      it 'places the robot and reports its position' do
        robot.place(1, 1, 'NORTH')
        correct_response = [1, 1, 'NORTH']
        expect(test_response).to eq(correct_response)
      end

      it 'ignores facing case' do
        robot.place(1, 1, 'south')
        correct_response = [1, 1, 'SOUTH']
        expect(test_response).to eq(correct_response)
      end

      it 'overrides current position if already placed' do
        robot.place(1, 1, 'WEST')
        robot.place(3, 3, 'SOUTH')
        correct_response = [3, 3, 'SOUTH']

        expect(test_response).to eq(correct_response)
      end
    end

    describe 'invalid placements' do
      it 'rejects missing fields' do
        robot.place(1, 1, '')
        correct_response = nil

        expect(test_response).to eq(correct_response)
      end

      it 'rejects non-numeric coordinates' do
        robot.place('blue', 1, 'NORTH')
        correct_response = nil

        expect(test_response).to eq(correct_response)
      end

      it 'rejects non-integer coordinates' do
        robot.place(1.5, 1, 'NORTH')
        correct_response = nil

        expect(test_response).to eq(correct_response)
      end

      it 'rejects out of table bounds placement' do
        robot.place(6, 1, 'NORTH')
        correct_response = nil

        expect(test_response).to eq(correct_response)
      end

      it 'rejects invalid facing' do
        robot.place(1, 1, 'green')
        correct_response = nil

        expect(test_response).to eq(correct_response)
      end
    end
  end

  describe 'Move' do
    it 'moves robot forward' do
      robot.place(1, 1, 'NORTH')
      robot.move
      correct_response = [1, 2, 'NORTH']

      expect(test_response).to eq(correct_response)
    end

    it "doesn't move robot off board" do
      robot.place(1, 5, 'NORTH')
      robot.move
      correct_response = [1, 5, 'NORTH']

      expect(test_response).to eq(correct_response)
    end

    it "doesn't move robot if uninitialized" do
      robot.place(1, '', 'SOUTH')
      robot.move
      correct_response = nil

      expect(test_response).to eq(correct_response)
    end
  end

  describe 'Left' do
    it 'turns robot counter-clockwise' do
      robot.place(1, 1, 'NORTH')
      robot.left
      correct_response = [1, 1, 'WEST']

      expect(test_response).to eq(correct_response)
    end
    it 'turns robot counter-clockwise twice loopsback' do
      robot.place(1, 1, 'NORTH')
      robot.left
      robot.left
      correct_response = [1, 1, 'SOUTH']

      expect(test_response).to eq(correct_response)
    end

    it 'ignores commands if uninitialized' do
      robot.place(1, 1)
      robot.left
      correct_response = nil

      expect(test_response).to eq(correct_response)
    end
  end

  describe 'Right' do
    it 'turns robot clockwise' do
      robot.place(1, 1, 'NORTH')
      robot.right
      correct_response = [1, 1, 'EAST']

      expect(test_response).to eq(correct_response)
    end
    it 'turns robot clockwise loops back' do
      robot.place(1, 1, 'WEST')
      robot.right
      robot.right
      correct_response = [1, 1, 'EAST']

      expect(test_response).to eq(correct_response)
    end

    it 'ignores commands if uninitialized' do
      robot.place(1, 1)
      robot.right
      correct_response = nil

      expect(test_response).to eq(correct_response)
    end
  end
end
