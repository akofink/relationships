class Model
  attr_accessor :file_contents

  def initialize(args = {})
    @file_contents = File.read args[:file] if args[:file]
  end

  def relationships
    @relationships ||= extract_relationships
  end

  def self.from_file(file)
    Model.new file: file
  end

  private

  def extract_relationships
    @file_contents.scan /belongs_to|has_many|has_one/
  end
end
