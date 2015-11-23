require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'spec'
  t.libs << 'lib'
  t.test_files = FileList['spec/**/*_spec.rb']
end

task :default => :test

GENERATED_PARSER = 'lib/plotter/parser/parser.racc.rb'
GENERATED_LEXER = 'lib/plotter/parser/parser.rex.rb'

file GENERATED_LEXER => 'lib/plotter/parser/parser.rex' do |t|
  sh "rex -o #{t.name} #{t.prerequisites.first}"
end

file GENERATED_PARSER => 'lib/plotter/parser/parser.racc' do |t|
  sh "racc -o #{t.name} #{t.prerequisites.first}"
end

task :parser => [GENERATED_LEXER, GENERATED_PARSER]

# Make sure the parser's up-to-date when we test.
Rake::Task['test'].prerequisites << :parser
