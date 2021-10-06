# frozen_string_literal: true

require './lib/file_reader'

RSpec.describe FileReader do
  describe 'Input' do
    it 'opens a file' do
      reader = FileReader.new('spec/test1.txt')
      expect(reader).to be_a FileReader
    end
    it "doesn't open a nonexistent file" do
      expect { FileReader.new('blah.txt') }.to raise_error(ArgumentError)
    end
  end

  describe 'process' do
    it 'parses lines and relays robot output' do
      reader = FileReader.new('spec/test1.txt')
      expect { reader.process_input }.to output("0, 1, NORTH\n0, 0, WEST\n3, 3, NORTH\n").to_stdout
    end
  end
end
