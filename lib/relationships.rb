require 'rails'

Gem.find_files('relationships/*').each {|m| require m}

class Relationships
  def self.run!
    model_files = Dir[Pathname.new('app/models/*')]
    models = FileParser.parse model_files
    MarkdownGenerator.output models
  end
end
