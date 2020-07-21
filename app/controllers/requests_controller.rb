# frozen_string_literal: true

class RequestsController < ApplicationController
  COUNTER_REDIS_KEY = 'counter'

  def show
    counter = Redis.current.get(COUNTER_REDIS_KEY) || '0'
    render plain: counter
  end

  def inc
    Redis.current.incr(COUNTER_REDIS_KEY)
  end
end
