class Model
  attr_accessor :file_contents, :file_path

  def self.from_file(file)
    Model.new file: file
  end

  def initialize(args = {})
    @file_path = args[:file]
    @file_contents = File.read file_path if file_path
  end

  def relationships
    @relationships ||= extract_relationships
  end

  def file_name
    file_path[/\w+\.rb/]
  end

  def class_name
    file_name[/\w+/].camelize
  end

  private

  def extract_relationships
    @file_contents.scan /belongs_to.+$|has_many.+$|has_one.+$|has_and_belongs_to_many.+$/
  end
end
