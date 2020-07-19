class ApplicationController < ActionController::API
  before_action :validate_api_key!

  def validate_api_key!
    head :unauthorized unless valid_api_key?
  end

  def valid_api_key?
    request.headers[:apikey] == Rails.configuration.api_key
  end
end
