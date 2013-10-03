Gem::Specification.new do |s|
  s.name        = 'Relations'
  s.version     = '0.0.1'
  s.summary     = "Compiles a list of ActiveRecord relations in a Rails application."
  s.description = "One simply calls rake relations to generate relation output."
  s.authors     = ["Andrew Kofink"]
  s.email       = 'ajkofink@gmail.com'
  s.files       = [
    'lib/relations.rb',
    'lib/relations/file_parser.rb',
    'lib/relations/markdown_generator.rb',
    'lib/relations/model.rb'
  ]
  s.homepage    = 'https://github.com/akofink/relations'
  s.licenses    = 'Beerware'
  s.executables << 'relations'
end
