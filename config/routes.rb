Rails.application.routes.draw do
  get '/new' => 'games#new'
  post '/score' => 'games#score'
end
