require 'spec_helper'

describe Relations::FileParser do
  describe '.parse' do
    it 'parses each model file' do
      Relations::Model.should_receive(:from_file).at_least(2).times
      Relations::FileParser.parse ['x', 'y']
    end
  end
end
