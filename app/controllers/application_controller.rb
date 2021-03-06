require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    if logged_in
      featured_event
      logged_in_user_id = session[:user_id]
      @user = User.find_by(id: logged_in_user_id)
      erb :'home'
    else
      redirect '/login'
    end
  end

  helpers do

    def logged_in
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def featured_event
      @featured_event = Event.all.sample
    end

    

  end

end
