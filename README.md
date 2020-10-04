## How to run

Run commands:

`$ bundle install`

`$ yarn install`

`$ rake db:setup`

`$ rake db:migrate`

When all dependencies are installed, run a server with `rails server` command. 

### PostgreSQL database setup

Before you continue, make sure you have installed [PostgreSQL](https://www.postgresql.org/download) on your machine.

Configure _database.yml_ in your Rails config folder with something like this. Be sure to replace `<username>` and `<password>` with your own fields.

```yaml
default: &default
  adapter: postgresql
  username: <username>
  password: <password>
  pool: 5
  timeout: 5000

development:
  <<: *default
  database: my_db_dev

test:
  <<: *default
  database: my_db_test

production:
  <<: *default
  database: my_db_prod
```

To create a user and to add a permission to create databases you need to type following commands in _psql_ shell.

```bash
$ create user <username> with password '<password>';
$ alter user <username> createdb;
```
