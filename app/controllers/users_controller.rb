class UsersController < ApplicationController

  get '/users/:id' do
    if logged_in
      @user = User.find_by(id: params[:id])
      erb :'users/show'
    else
      erb :home
    end
  end


end