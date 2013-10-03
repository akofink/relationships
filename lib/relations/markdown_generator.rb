class MarkdownGenerator
  attr_accessor :models, :relations_path

  def self.output(models)
    generator = MarkdownGenerator.new models: models
    generator.output!
  end

  def initialize(args = {})
    @relations_path = Pathname.new('').join 'relations'
    @models = args[:models]
    make_relations_directory
  end

  def file
    @output_file ||= File.new(relations_path.join('relations.md'), 'w')
  end

  def output!
    models.each do |model|
      file.write "\n# #{model.class_name}\n"
      model.relationships.each do |relationship|
        file.write "* #{relationship}\n"
      end
    end
    file.close
  end

  private

  def make_relations_directory
    Dir.mkdir @relations_path unless Dir.exists? @relations_path
  end
end
