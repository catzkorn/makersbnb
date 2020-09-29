require "sinatra/base"
require "./lib/user_management"
require "./lib/user"
require './lib/space_manager'
require './lib/database_connection'

class Makersbnb < Sinatra::Base
  enable :sessions
  DatabaseConnection.setup('makersbnb')
  
   get "/" do
    erb(:index)
  end

  post "/signup" do
    UserManagement.sign_up(User.new(params[:email], params[:name], params[:password]))

    redirect("/spaces")
  end

  get "/sessions/new" do
    erb(:login)
  end

  post "/sessions" do
    user = UserManagement.login(params[:email], params[:password])
    session[:user] = user.user_id
    redirect("/spaces")
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new/add' do
    new_space = Space.new(params[:name], params[:price], params[:description], nil, session[:user])
    SpaceManager.create(new_space)
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = SpaceManager.all
    erb :'/spaces/spaces'
  end

  get '/spaces/:userid' do
    @user_spaces = SpaceManager.user_spaces(session[:user])
    erb :'spaces/user_spaces'
  end

  run! if app_file == $0
end
