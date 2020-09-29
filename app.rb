require "sinatra/base"
require "./database_connection_setup"
require "./lib/user_management"
require "./lib/user"

class Makersbnb < Sinatra::Base

  enable :sessions

  get "/" do
    erb(:index)
  end

  post "/signup" do
    UserManagement.sign_up(User.new(params[:email], params[:name], params[:password]))

    redirect("/spaces")
  end

  get "/spaces" do
    "Welcome test_name"
  end

  get "/sessions/new" do 
    erb(:login)
  end 

  post "/sessions" do 
    user = UserManagement.login(params[:email], params[:password])
    session[:user] = user.id
    redirect('/spaces')
  end

  run! if app_file == $0
end
