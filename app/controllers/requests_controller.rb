# frozen_string_literal: true

class RequestsController < ApplicationController
  REQUESTS_COUNTER_REDIS_KEY = 'requests:counter'

  def show
    render plain: redis.get(REQUESTS_COUNTER_REDIS_KEY)
  end

  def inc
    redis.incr(REQUESTS_COUNTER_REDIS_KEY)
  end

  private

  def redis
    @redis ||= Redis.current
  end
end
