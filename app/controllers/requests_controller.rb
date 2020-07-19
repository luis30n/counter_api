# frozen_string_literal: true

class RequestsController < ApplicationController
  REQUESTS_COUNTER_REDIS_KEY = 'requests:counter'

  def show
    n_requests = redis.get(request_per_second_counter).to_i
    render plain: n_requests
  end

  def inc
    redis.multi do |multi|
      multi.incr(requests_per_second_counter)
      multi.expire(requests_per_second_counter, 1)
    end
  end

  private

  def requests_per_second_counter
    "#{REQUESTS_COUNTER_REDIS_KEY}:timestamp"
  end

  def timestamp
    Time.now.to_i
  end

  def redis
    @redis ||= Redis.current
  end
end
