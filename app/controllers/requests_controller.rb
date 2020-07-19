# frozen_string_literal: true

class RequestsController < ApplicationController
  REQUESTS_COUNTER_REDIS_KEY = 'requests:counter'

  def show
    n_requests = redis.get(REQUESTS_COUNTER_REDIS_KEY).to_i
    render plain: n_requests
  end

  def inc
    redis.incr(REQUESTS_COUNTER_REDIS_KEY)
  end

  private

  def redis
    @redis ||= Redis.current
  end
end
