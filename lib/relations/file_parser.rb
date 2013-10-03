module Relations
  class FileParser
    def self.parse model_files
      models = model_files.map do |model_file|
        Model.from_file model_file
      end
    end
  end
end
