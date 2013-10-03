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
    it 'extracts relationshipship strings' do
      model.relationships.count.should == 2
    end
  end

  describe '#file_name' do
    it 'extracts the name' do
      File.stub :read
      model.file_name.should == 'test_model.rb'
    end
  end

  describe '#name' do
    it 'extracts the model name' do
      File.stub :read
      model.class_name.should == 'TestModel'
    end
  end
end
