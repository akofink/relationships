require 'spec_helper'

describe Model do
  let(:model) { Model.from_file 'spec/assets/test_model.rb' }
  describe '.from_file' do
    it 'reads the file' do
      File.should_receive :read
      model.stub :extract_relationships
      model
    end
  end

  describe '#relationships' do
    it 'extracts relationship strings' do
      model.relationships.count.should == 2
    end
  end
end
