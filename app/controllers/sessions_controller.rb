class SessionController < ApplicationController

  get '/signup' do
    erb :'sessions/signup'
  end

  post '/signup' do
    user = User.new(params[:user])
    
    if user.save
      session[:user_id] = user.id
      redirect to '/'
    else
      @error = "This username is already in use"
      erb :'sessions/signup'
    end
  end

  get '/login' do
    if logged_in
      redirect '/'
    else
      erb :'sessions/login'
    end
    
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/'
    else
      @error = "Invalid Credentials"
      erb :'sessions/login'
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end