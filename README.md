# Rails Linting CI
This is a Rails application, initially generated using [Potassium](https://github.com/platanus/potassium) by Platanus.

The idea of this project is to try different approaches to the linting phase of the development process. This repository showcases 2 main alternatives:

1. Use CircleCI workflows, adding another job alongside the original for testing. This `lint` job runs parallel, and uses [reviewdog](https://github.com/reviewdog/reviewdog) to format error messages from linters, and comment pull requests.
2. Use GitHub Actions, adding a new CI build just for the linting purpose. It also uses reviewdog.

Both approaches work fine, but CircleCI provides some perks, like shared secrets between the whole organization through [contexts](https://circleci.com/docs/2.0/contexts/), so that the token for reviewdog is not needed in each repository's secrets.

The linters being used in both CI alternatives are `rubocop`, `eslint` and `stylelint`. Every linter is installed in the CI machine with the version locked in either the `Gemfile.lock` or `yarn.lock`. They also use local rules hosted in the repo.

## Local installation

Assuming you've just cloned the repo, run this script to setup the project in your
machine:

    $ ./bin/setup

It assumes you have a machine equipped with Ruby, Node.js, Docker and make.

The script will do the following among other things:

- Install the dependecies
- Create a docker container for your database
- Prepare your database
- Adds heroku remotes

After the app setup is done you can run it with [Heroku Local]

    $ heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local


## Continuous Integrations

The project is setup to run tests
in [CircleCI](https://circleci.com/gh/platanus/t0/tree/master)

You can also run the test locally simulating the production environment using docker.
Just make sure you have docker installed and run:

    bin/cibuild


## Style Guides

The style guides are enforced through a self hosted version of [Hound CI](http://monkeyci.platan.us). The style configuration can also be used locally
in development runing `rubocop` or just using the rubocop integration for your text editor of choice.

You can add custom rules to this project just adding them to the `.ruby-style.yml` file.


## Internal dependencies

### Authentication

We are using the great [Devise](https://github.com/plataformatec/devise) library by [PlataformaTec](http://plataformatec.com.br/)

### Rails pattern enforcing types

This projects uses [Power-Types](https://github.com/platanus/power-types) to generate Services, Commands, Utils and Values.

### Error Reporting

To report our errors we use [Sentry](https://github.com/getsentry/raven-ruby)

### Scheduled Tasks

To schedule recurring work at particular times or dates, this project uses [Sidekiq Scheduler](https://github.com/moove-it/sidekiq-scheduler)

### Queue System

For managing tasks in the background, this project uses [Sidekiq](https://github.com/mperham/sidekiq)

## Seeds

To populate your database with initial data you can add, inside the `/db/seeds.rb` file, the code to generate **only the necessary data** to run the application.
If you need to generate data with **development purposes**, you can customize the `lib/fake_data_loader.rb` module and then to run the `rake load_fake_data` task from your terminal.

