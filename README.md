# Training

## Monday and Tuesday

* RVM
* RBENV
* RSpec

## Wednesday

* JSON API
* RESTful Services
* Building Gems

## Thursday

* Redis / Resque Workers

```
$ brew install redis
$ redis-server
```

* Asset Pipeline

* Passenger

```
$ gem install passenger
$ passenger start
$ RAILS_ENV=production rake db:migrate
$ rake assets:precompile
$ RAILS_ENV=production passenger start
```

* Nginx

Default Nginx Configuration (`nginx-proxy_pass.conf`)

```
$ brew install nginx --with-passenger
# Start Nginx
$ nginx
# Stop Nginx
$ nginx -s stop
```

Nginx Passenger Configuration (`nginx-passenger_boot.conf`)

```
$ brew install nginx --with-passenger
# Start Nginx
$ nginx
# Stop Nginx
$ nginx -s stop
$ rvm wrapper ruby-1.9.2-p290 passenger
# Find the location of the passenger gem and find the location of the passenger ruby
$ bundle info passenger
$ which passenger_ruby
```

* Mountable Frameworks
* Apache

## Friday and Beyond

* Memcache / Caching
* Factory Girl
* Rails 4 Differences
* Strong Parameters
* Performance

## Contact Manager - Feedback

* Remove branches after completing the iterations
* page 18 the controller valid attributes is now let and not def