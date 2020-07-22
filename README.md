# Proxy Limiter
This repository implements rails API. Two endpoints are provided:
```
  1. /counter --> returns a counter value
  2. /counter/inc --> increase the counter value by 1
```
## Requirements

rvm install 2.5.8
rvm use 2.5.8

## Local Installation

### 1. Clone Github repo && Install Ruby gems

```
git clone https://github.com/luis30n/counter_api.rb
cd ./proxy_limiter
gem install bundler
bundle install
```


### 2. Configure database:
```
This project only uses redis as database. You may run it on MacOS as:
  1. brew install redis
  2. brew services start redis
```

### 3. Run the tests to know everything is working fine:
```
RAILS_ENV=test bundle exec rspec
```

### 4. Adapt your /etc/hosts file
Add 127.0.0.1 bitnami.counter.api to your /etc/hosts file.

### 5. Launch local proxy server:
 * `rails server -p 3010`

### 6. Test the API
You may access `http://bitnami.counter.api`  with any of the endpoints (`/counter` or `/counter/api`).
An `apikey="mock_api_key"` validation has been added to mock a bit a real API behavior.

This a simple postman collection do perform both http requests https://www.getpostman.com/collections/57fae788d5297859e2cf

To the functionality of this API with the proxy rate limiter you may check https://github.com/luis30n/proxy_limiter/blob/master/README.md#7-test-the-api-proxy

## 7. Warning
This setup has been developed and tested using MacOS, there may be some additional configuration issues.
