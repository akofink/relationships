class MarkdownGenerator
  attr_accessor :models, :relationships_path

  def self.output(models)
    generator = MarkdownGenerator.new models: models
    generator.output!
  end

  def initialize(args = {})
    @relationships_path = Pathname.new('').join 'relationships'
    @models = args[:models]
    make_relationships_directory
  end

  def file
    @output_file ||= File.new(relationships_path.join('relationships.md'), 'w')
  end

  def output!
    models.each do |model|
      file.write "\n# #{model.class_name}\n"
      model.relationships.each do |relationshipship|
        file.write "* #{relationshipship}\n"
      end
    end
    file.close
  end

  private

  def make_relationships_directory
    Dir.mkdir @relationships_path unless Dir.exists? @relationships_path
  end
end
