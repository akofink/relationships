require 'rails'

Dir['./lib/relations/*'].map {|m| require m}

module Relations
  class Application
    def self.run!
      model_files = Dir[Rails.root.join('app/models/*')]
      models = FileParser.parse_files model_files
      MarkdownGenerator.output models
    end
  end
end
