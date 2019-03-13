require './lib/groupdocs_assembly_cloud/version'

Gem::Specification.new do |s|
  s.name        = 'groupdocs_assembly_cloud'
  s.version     = GroupDocsAssemblyCloud::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'EvgenyKuleshov'
  s.email       = 'evgeny.kuleshov@aspose.com'
  s.homepage    = 'https://git.auckland.dynabic.com/groupdocs.assembly/assembly-ruby-sdk'
  s.summary     = 'Ruby library for communicating with the GroupDocs.Assembly Cloud API'
  s.description = 'This SDK allows you to work with GroupDocs.Assembly Cloud REST APIs
                  in your Ruby applications quickly and easily, with zero initial cost'
  s.license     = 'MIT'

  s.add_runtime_dependency 'faraday', '~> 0.14.0'
  s.add_runtime_dependency 'mimemagic', '~> 0.3.2'
  
  s.add_development_dependency 'aspose_storage_cloud', '~> 18.6', '>= 18.5'
  s.add_development_dependency 'minitest', '~> 5.11', '>= 5.11.3'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.required_ruby_version = '~> 2.3'
end
