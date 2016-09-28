
task default: [:test]

task :test do
  ruby 'test/test_word_challenge.rb'
end

task :main do
  ARGV.each { |a| task a.to_sym do ; end }
  file_name = ARGV[1]

  ruby "main.rb #{file_name}"
end
