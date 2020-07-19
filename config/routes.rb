Rails.application.routes.draw do
  get '/counter', to: 'counter#show'
  post '/counter/inc', to: 'counter#inc'
end
