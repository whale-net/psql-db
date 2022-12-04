# whale-db

whale net docker app for managing psql database
hopefully will make it easier to build and deploy pet projects once everything is in place

## main idea
use flyway to manage database maintenance. make it easy to test locally, and deploy remotely without having to remember various docker deploments.
maybe further into the future even some CI/CD or code review benefits

## important notes
main branch is protected to prevent accidental deployments

## how to run
1. run `cp .env.example .env` and modify the `.env` file to include the correct secrets
2. (apparently this step isn't needed, so uhhh yeah, optional) run `export $(cat .env | sed 's/\r$//' | xargs)` to export env variables to your current environment
3. run `docker compose up -d` to run container locally
  a. `-d` is for detached mode (runs in background)
  b. `docker compose down` will shutdown container
  c. flyway will run a migration whenever you run `docker compose up`. this will bring your local database up to date with whatever this repo has
  d. database port that is publically made accessible is `11420`. this is routed to `5432` internally within the container

## flyway naming scheme
https://flywaydb.org/documentation/concepts/migrations#naming
