require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'ruby_ragel_examples'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  # test.libs << 'lib' << 'test'
  test.pattern = 'test_*.rb'
  test.verbose = true
end

task :default => :test
