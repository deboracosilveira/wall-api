# WALL API

Wall api is a backend app built with [Ruby on Rails 7](https://rubyonrails.org/).

Referring frontend app can be found [here](https://github.com/deboracosilveira/wall-ui).

## DEVELOP

Wall app relies on some environment variables in order to operate correctly.
For running it locally, create a `.env` file with same variables as [.env.example](.env.example).
> To generate DEVISE_JWT_SECRET_KEY you can use `rake secret` from [Rails Command Line](https://guides.rubyonrails.org/v4.0/command_line.html).

#### SERVICES

The simplest way to run the app is with [Docker](https://docs.docker.com/get-docker/) & [Docker Compose](https://docs.docker.com/compose/install/).

Current services:
- Rails `http://localhost:3001`
- Postgres `port 5432`
- [MailCatcher](https://mailcatcher.me/) `http://localhost:1080` 

Build Docker images from the Dockerfile:
```sh
%> docker compose build
```

Create, migrate and seed database:
```sh
%> docker compose run --rm web bin/rails db:setup
```

Running server:
```sh
%> docker compose up
```

Stop containers and remove containers, networks, volumes, and images
```sh
%> docker compose down
```

## TEST
Wall api uses [RSpec](https://rspec.info/).

```sh
%> docker compose run --rm web bundle exec rspec
```

## DEPLOY
The api is hosted on [Heroku](https://www.heroku.com/) at https://wall-api.herokuapp.com/
