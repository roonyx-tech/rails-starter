# About

Rails Starter Kit was created as a way to save time when starting a new Rails project. 
We have taken the most common functionality and configuration in our existing Rails projects, and put those into this project. 
Simply clone this project, and change the git remote to your remote repository. 
Rails Starter Kit is ready to start with docker-compose.

## Table of contents

* [Out-of-the-box functionality](#out-of-the-box-functionality)
* [Getting started](#getting-started)
    * [Init](#init)
    * [Docker build](#docker-build)
    * [Run app](#run-app)
    * [Down app](#down-app)
* [Docker](#docker)
    * [migrate](#migrate)
    * [rollback](#rollback)
    * [bundle](#bundle)
    * [Reset database](#reset-database)
    * [Rails console](#rails-console)
    * [Run custom command](#run-custom-command)
* [Tests, Lints, Docs](#tests-lints-docs)
    * [Running tests](#running-tests)
    * [JSON context in rspec](#json-context-in-rspec)
    * [Running lints](#running-lints)
    * [Generate docs](#generate-docs)
    * [Coverage report](#coverage-report)
* [Additional functionality](#additional-functionality)
  * [Application Service](#application-service)
  * [Debug](#debug)
* [License](#license)

## Out-of-the-box functionality

- [docker-compose](https://docs.docker.com/compose/) configuration for start project
- [Sidekiq](https://github.com/mperham/sidekiq) configuration for background processing
- [rack-cors](https://github.com/cyu/rack-cors) provides support for Cross-Origin Resource Sharing (CORS)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) for fixtures
- [faker](https://github.com/faker-ruby/faker) for generates fake data
- [active_model_serializers](https://github.com/rails-api/active_model_serializers/tree/0-10-stable) for serialize json
- [byebug](https://github.com/deivid-rodriguez/byebug) simple to use and feature rich debugger for Ruby
- [bullet](https://github.com/flyerhzm/bullet) for detect N+1 queries
- [rspec](https://github.com/rspec/rspec-rails) testing framework
- [rswag](https://github.com/rswag/rswag) for generate api docs
- [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) containing strategies for cleaning your database
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) provides RSpec-compatible one-liners to test common Rails functionality
- [simplecov](https://github.com/simplecov-ruby/simplecov) is a code coverage analysis tool for Ruby
- [rubocop](https://github.com/rubocop/rubocop) static code analyzer (a.k.a. linter)
- [annotate](https://github.com/ctran/annotate_models) for schema comment

## Getting started

Requirements:

- Ruby >= 3.0.2

### Init

1. Clone Rails Starter Kit
2. Execute bundle && rails g rename:into YourAppName
3. Go to ./../YourAppName
4. Create a new repository on GitHub, BitBucket, or your own server 
5. Change the git remote to your new repository
6. Push changes

### Docker build
```
make setup
```

### Run app
```
docker-compose up
```

### Down app
```
docker-compose down
```

## Docker

### Migrate
```
make migrate
```

### Rollback
```
make rollback
```

### Bundle
```
make bundle
```

### Reset database
```
make reset
```

### rails console
```
make console
```

### Run custom command
```
docker-compose run --rm rails bundle exec <your_custom_command>
```

## Tests, Lints, Docs

### Ci task
- To run the CI task run:
```
rake ci
```

### Running tests

- To run the test suite simply run:
```
rspec
```

### JSON context in rspec
- Setup json helper in your spec file
```ruby
include_context :json
```
- And easy use json in expect
```ruby
expect(json).not_to eq []
```

### Running lints

- To run rubocop lint
```
rubocop
```

- Auto correct rubocop lint
```
rubocop -a
```

### Generate docs

```
rake docs:generate
```

### Coverage report

After call `rspec` will be in the `./coverage` folder

## Additional functionality

### Application Service

Service objects are Plain Old Ruby Objects (PORO) that are designed to execute one single action in your domain logic and do it well.

- Example service object
```ruby
class ExampleService < ApplicationService
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  def call
    puts "Hello #{name}"
  end
end
```
- For call object
```ruby
ExampleService.call('name')
```

### Debug
Setup `byebug` in your code, then attach to running container:
```
docker attach [rails_container_id]
```
- `Ctrl+D` to the next point
- `continue` to finish debug
- `Ctrl+P` then `Ctrl+Q` to detach container


## License

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/roonyx-tech/rails-starter/blob/master/LICENSE)
