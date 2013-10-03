require 'spec_helper'

describe Relationships do
  describe '.run!' do
    it 'uses the FileParser to parse each model file' do
      FileParser.should_receive :parse
      MarkdownGenerator.should_receive :output
      Relationships.run!
    end
  end
end
