require 'spec_helper'

describe Relations::Application do
  describe '.run!' do
    it 'uses the FileParser to parse each model file' do
      Rails.stub(:root).and_return Pathname.new('')
      FileParser.should_receive :parse_files
      Relations::Application.run!
    end
  end
end
