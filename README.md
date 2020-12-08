# DataShop

## Ruby Version

ruby 2.6.6p146
rails Rails 6.0.3.4

## System dependencies

Linux ubuntu 5.4.0-56-generic #62~18.04.1-Ubuntu SMP Tue Nov 24 10:07:50 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
rubymine
psql (PostgreSQL) 13.0 (Ubuntu 13.0-1.pgdg18.04+1)
nvm v14.10.1

## Configuration

bundle install


## Database creation

rails db:migrate
rails db:seed

## test suite

rspec spec/models/fiction_spec.rb

## Services

Gmap Api
Echarts APi
activeadmin
bootstrap
devise
...

## Deployment Instructions

https://devcenter.heroku.com/articles/getting-started-with-rails6
App url: https://whispering-meadow-07108.herokuapp.com/

## Security

1. use activeadmin

2. use devise create user

3. use csrf_token

4. SQL Injection ? 
   1) Direct 404 for a function interface that the user passes a parameter to maliciously access.
    ` 
     def show

   not_found
     end
     `
     2)Receives the parameters passed by the user, but is validated by the front-end JS.
     '
   def search
    name = params[:name]
     end
     '
     '<script>
    window['countries'] = [
        'Afghanistan',
        'Albania',
        'Algeria',
        'Andorra',
        'Angola',
        'Antigua & Barbuda',
        'Argentina',
        'Armenia',
        'Australia',
        'Austria',
        'Azerbaijan',
        'Bahamas',
        'Bahrain',
        'Bangladesh',
        'Barbados',
        .
        .
        .
        .
     </script>
     '

  5 Session ?
  1) Session information is stored in the database
  'Project::Application.config.session_store :active_record_store'
  2) User devise method:
  'before_action :authenticate_user!'
