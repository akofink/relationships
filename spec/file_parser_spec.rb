require 'spec_helper'

describe FileParser do
  describe '.parse' do
    it 'parses each model file' do
      Model.should_receive(:from_file).at_least(2).times
      FileParser.parse ['x', 'y']
    end
  end
end
