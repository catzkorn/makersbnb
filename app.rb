require "sinatra/base"
require "sinatra/flash"
require "./lib/user_management"
require "./lib/user"
require "./lib/space_manager"
require "./lib/database_connection"
require "./database_connection_setup.rb"

class Makersbnb < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  whichdb

  get "/" do
    erb(:index)
  end

  post "/signup" do
    UserManagement.sign_up(User.new(params[:email], params[:name], params[:password]))
    flash[:notice] = "Thank you for signing up - you are now logged in."
    redirect("/spaces")
  end

  get "/sessions/new" do
    erb(:login)
  end

  post "/sessions" do
    user = UserManagement.login(params[:email], params[:password])
    session[:user] = user.user_id
    flash[:notice] = "You are logged in."
    redirect("/spaces")
  end

  get "/spaces/new" do
    erb :'spaces/new'
  end

  post "/spaces/new/add" do
    new_space = Space.new(params[:name], params[:price], params[:description], nil, session[:user])
    SpaceManager.create(new_space)
    redirect "/spaces"
  end

  get "/spaces" do
    @spaces = SpaceManager.all
    erb :'/spaces/spaces'
  end

  get "/spaces/:userid" do
    @user_spaces = SpaceManager.user_spaces(session[:user])
    erb :'spaces/user_spaces'
  end

  post "/sessions/destroy" do
    session.clear
    flash[:notice] = "You are logged out."
    redirect("/sessions/new")
  end

  get "/space/:spaceid" do
    @viewed_space = SpaceManager.view_space(params[:spaceid])
    erb :'spaces/space'
  end

  post "/space/:spaceid/:months" do
    month = SpaceManager.month_conversion(params[:month])
    @available_dates = SpaceManager.availability(params[:spaceid], month)
    erb :'spaces/shitty_erb'
  end

  run! if app_file == $0
end
