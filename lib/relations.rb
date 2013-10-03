require 'rails'

Dir['./lib/relations/*'].map {|m| require m}

class Relations
  def self.run!
    model_files = Dir[Pathname.new('app/models/*')]
    models = FileParser.parse model_files
    MarkdownGenerator.output models
  end
end
