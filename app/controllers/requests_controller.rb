class RequestsController < ApplicationController
  def show
    render plain: redis.get(counter_key)
  end

  def inc
    redis.incr(counter_key)
  end

  private

  def counter_key
    "test_1"
  end

  def redis
    Redis.current
  end
end
