require "sinatra/base"
require './lib/space_manager'


class Makersbnb < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new/add' do
    new_space = Space.new(params[:name], params[:price], params[:description])
    SpaceManager.create(new_space)
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = SpaceManager.all
    erb :'/spaces/spaces'
  end

  # get '/spaces/:userid' do
  #   @user_spaces = SpaceManager.user_spaces(params[:userid])
  #   erb :'spaces/user_spaces'
  # end

  run! if app_file == $0
end
