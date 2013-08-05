== README

== To Add heroku production database and dev database; Make sure you remember which one is for development
 heroku addons:add heroku-postgresql
 heroku addons:add heroku-postgresql:dev

== To search for all your heroku databases
 heroku config | grep postgresql
 => DATABASE_URL:                postgres://xxxxxxxxxxxxxxxx:xxxxxxxxxxxxxx@ec2-x4x-2xxx-xxx6-xx7.compute-1.amazonaws.com:5432/xxxx
 => HEROKU_POSTGRESQL_NAVY_URL:  postgres://xxxxxxxxxxxxxxxx:xxxxxxxxxxxxxx@c2-x4-225-xxx-227.compute-1.amazonaws.com:5432/xxxx
 => HEROKU_POSTGRESQL_WHITE_URL: postgres://xxxxxxxxxxxxxxxx:xxxxxxxxxxxxx-X9_@xxxxx-102-1xx.compute-1.amazonaws.com:5432/xxxxx

 heroku pg:credentials [YOUR_HEROKU_DEV_DATABASE_COLOR]
 => dbname=xxxxxxxx host=xxxxxxx.compute-1.amazonaws.com port=5432 user=xxxxxxxx password=xxxxxxxxxx-X9_ sslmode=require


===
Do not assign into params anywhere.
```
http://stackoverflow.com/questions/17634684/modifying-predefined-params-var-in-sinatra-renders-it-nil
```
