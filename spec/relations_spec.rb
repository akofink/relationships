require 'spec_helper'

describe Relations::Application do
  describe '.run!' do
    it 'uses the FileParser to parse each model file' do
      Relations::FileParser.should_receive :parse_files
      Relations::MarkdownGenerator.should_receive :output
      Relations::Application.run!
    end
  end
end
