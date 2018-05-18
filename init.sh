#!/bin/sh

set -e
export set RAILS_ENV=$RAILS_ENV

if ! gem list rails -i ; then
  echo ">>>>>>>>>>>>Installing Rails..."
  gem install rails -v '5.1.6'

  if [ ! -f $APP_NAME/app ]
  then
     echo ">>>>>>>>>>>>Creating new Application..."
     rails new $APP_NAME
     echo ">>>>>>>>>>>>Provide Permission to the Application..."
     chmod -R 777 $APP_NAME
  fi
fi

cd /opt/$APP_NAME

if [ $CODE_CHANGE = 'yes' ]
then
    echo ">>>>>>>>>>>>Bundle Install..."
    bundle install

    echo ">>>>>>>>>>>>Upgrading database..."
    #rails db:migrate

    echo ">>>>>>>>>>>>Seed data"
    #bundle exec rake db:seed

    echo ">>>>>>>>>>>>Precompiling assets..."
    #bundle exec rake assets:precompile
fi

if [ $RAILS_ENV = 'development' ]
then
   echo ">>>>>>>>>>>>Starting application server..."
   bundle exec rails s -b 0.0.0.0 -p $APP_PORT -e development
elif [ $RAILS_ENV = 'production' ]
then
   echo ">>>>>>>>>>>>Starting application server..."
   bundle exec rails s -b 0.0.0.0 -p $APP_PORT -e production
fi
