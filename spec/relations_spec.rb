require 'spec_helper'

describe Relations do
  describe '.run!' do
    it 'uses the FileParser to parse each model file' do
      FileParser.should_receive :parse_files
      MarkdownGenerator.should_receive :output
      Relations.run!
    end
  end
end
