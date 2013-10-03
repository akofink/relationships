require 'rails'

Dir['./lib/relationships/*'].map {|m| require m}

class Relationships
  def self.run!
    model_files = Dir[Pathname.new('app/models/*')]
    models = FileParser.parse model_files
    MarkdownGenerator.output models
  end
end
