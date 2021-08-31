require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::Console if ENV['CI'].eql? 'active'
SimpleCov.minimum_coverage(100) unless ENV['DISABLE_MINIMUM_COVERAGE']
SimpleCov.start('rails') do
  add_filter '/db/'
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/vendor/'
  add_filter '/app/helpers/'
  add_filter '/app/channels/application_cable/'
  add_filter '/app/jobs/'
  add_filter '/app/mailers/'
  add_filter '/app/serializers/'
  add_filter '/lib/assets/'
  add_filter '/lib/generators/'
  add_filter '/lib/faker/'

  add_group 'Controllers', 'app/controllers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Interactors', 'app/interactors'
end
