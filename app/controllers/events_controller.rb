class EventController < ApplicationController

  get '/events' do 
    @events = Event.all
    erb :'events/all'
  end

  get '/my-events' do
    @events = Event.where(user_id: current_user.id)
    erb :'/events/my_events'
  end

  get '/events/new' do
    if logged_in
      erb :'events/new'
    else
      redirect '/login'
    end
  end

  post '/events/new' do
    event = Event.new(params[:event])
    event.user_id = current_user.id
    event.save
    redirect "/events/#{event.id}"
  end

  get '/events/:id' do
    id = params[:id]
    @event = Event.find(id)
    erb :'/events/show'
  end

  #edit
  get '/events/:id/edit' do
    @event = Event.find_by(id: params[:id])
    erb :'events/edit'
  end

  #update
  put '/events/:id' do
    event = Event.find_by(id: params[:id])
    event.update(params[:event])
    redirect to "/events/#{event.id}"
  end


  delete '/events/:id' do
    event = Event.find_by(id: params[:id])
    event.destroy
    redirect to "/events"
  end

  # get '/events/by_genre/:genre'
end