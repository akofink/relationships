module Relations
  class MarkdownGenerator
    attr_accessor :models, :relations_path

    def self.output(models)
      generator = MarkdownGenerator.new models: models
      generator.output!
    end

    def initialize(args = {})
      @relations_path = Rails.root.join 'relations'
      @models = args[:models]
    end

    def file
      @output_file ||= File.new(relations_path.join('relations.md'), 'w')
    end

    def output!
      models.each do |model|
        file.write "# #{model.class_name}\n"
        model.relationships.each do |relationship|
          file.write "* #{relationship}"
        end
      end
    end

    private

    def make_relations_directoy
      Dir.mkdir @relations_path
    end
  end
end
