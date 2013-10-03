Gem::Specification.new do |s|
  s.name        = 'relationships'
  s.version     = '0.0.1'
  s.summary     = "Compiles a list of ActiveRecord relationships in a Rails application."
  s.description = "One simply calls relationships to generate ActiveRecord relationship output."
  s.authors     = ["Andrew Kofink"]
  s.email       = 'ajkofink@gmail.com'
  s.files       = [
    'lib/relationships.rb',
    'lib/relationships/file_parser.rb',
    'lib/relationships/markdown_generator.rb',
    'lib/relationships/model.rb'
  ]
  s.homepage    = 'https://github.com/akofink/relationships'
  s.licenses    = 'Beerware'
  s.executables << 'relationships'
end
