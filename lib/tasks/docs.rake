namespace :docs do
  desc 'Verify that all FactoryBot factories are valid'
  task generate: :environment do
    system("bundle exec rake rswag SWAGGER_DRY_RUN=0 RSWAG=true RAILS_ENV='test'")
    raise if $?&.exitstatus&.nonzero?
  end
end
