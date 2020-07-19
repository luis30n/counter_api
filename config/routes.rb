Rails.application.routes.draw do
  get '/counter', to: 'requests#show'
  post '/counter/inc', to: 'requests#inc'
end
