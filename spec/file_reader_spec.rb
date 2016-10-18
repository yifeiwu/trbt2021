require './lib/file_reader'

RSpec.describe FileReader do
  describe "Input" do
    it "opens a file" do
      reader = FileReader.new('spec/test.txt')
      expect(reader).to be_a FileReader
    end
    it "doesn't open a nonexistent file" do
       expect { FileReader.new('blah.txt') }.to raise_error(ArgumentError)
    end
  end

  describe "Output" do
  	it "relay robot output" do
  	end
  end
end