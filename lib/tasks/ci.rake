desc 'Run CI checks'
task :ci do
  [
    'bundle exec rubocop',
    'bundle exec rspec',
    'rake docs:generate'
  ].each do |command|
    puts "------------  #{command}"
    break unless system(command)
  end
end
