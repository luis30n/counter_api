# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RequestsController, type: :controller do
  before do
    request.headers[:apikey] = 'mock_api_key'
  end

  let(:redis) { Redis.current }

  describe '#show' do
    subject(:show) { get :show }

    it 'routes to show' do
      expect(get: '/counter')
        .to route_to(controller: 'requests', action: 'show')
    end

    it 'calls redis get' do
      expect(redis).to receive(:get).once
      show
    end
  end

  describe '#inc' do
    subject(:inc) { post :inc }

    it 'routes to inc' do
      expect(post: '/counter/inc')
        .to route_to(controller: 'requests', action: 'inc')
    end

    it 'calls redis incr' do
      expect(redis).to receive(:incr).once
      inc
    end
  end
end
