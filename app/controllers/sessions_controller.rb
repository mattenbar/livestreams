class SessionController < ApplicationController

  get '/signup' do
    erb :'sessions/signup'
  end

  post '/signup' do
    user = User.create(params[:user])
    user.save
    session[:user_id] = user.id
    redirect to '/'
  end

end