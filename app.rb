require "sinatra/base"

class Makersbnb < Sinatra::Base

  get '/' do 
    erb(:sign_up)
  end 

  post '/signup' do
    redirect('/spaces')
  end

  get '/spaces' do
    "Welcome test_name"
  end
  
  run! if app_file == $0
end
