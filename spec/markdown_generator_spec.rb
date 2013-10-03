require 'spec_helper'

describe MarkdownGenerator do
  let(:model) { double('Model') }
  let(:markdown_generator) { MarkdownGenerator.new }
  let(:file) { double('File') }

  before(:each) do
    Dir.stub :mkdir
    File.stub :new
    markdown_generator.stub(:models).and_return [model, model]
    file.stub :write
  end

  describe '.output' do
    it 'outputs the models' do
      MarkdownGenerator.any_instance.should_receive :output!
      MarkdownGenerator.output [model]
    end
  end

  describe '#file' do
    it 'should create the files' do
      File.should_receive :new
      markdown_generator.file
    end
  end

  describe '#output!' do
    before(:each) do
      markdown_generator.stub(:file).and_return file
      file.stub(:write)
      file.stub(:close)
      model.stub(:class_name)
      model.stub(:relationships).and_return []
    end

    it 'should output each model relationships' do
      model.should_receive(:class_name).exactly(2).times
      markdown_generator.output!
    end

    it 'should output each model relationships' do
      model.should_receive(:relationships).exactly(2).times.and_return([])
      markdown_generator.output!
    end

    it 'should close the file' do
      file.should_receive(:close)
      markdown_generator.output!
    end
  end
end
