class EventController < ApplicationController

  get '/events' do 
    if logged_in
      @events = Event.all
      erb :'events/all'
    else
      redirect '/'
    end
  end

  get '/my-events' do
    if logged_in
      @events = Event.where(user_id: current_user.id)
      erb :'/events/my_events'
    else
      redirect '/'
    end
  end

  get '/events/new' do
    if logged_in
      erb :'events/new'
    else
      redirect '/'
    end
  end

  post '/events/new' do
    event = Event.new(params[:event])
    event.user_id = current_user.id
    event.save
    redirect "/events/#{event.id}"
  end

  get '/events/:id' do
    if logged_in
      id = params[:id]
      @event = Event.find(id)
      erb :'/events/show'
    else
      redirect '/'
    end
  end

  #edit
  get '/events/:id/edit' do
    if logged_in
      @event = Event.find_by(id: params[:id])
      erb :'events/edit'
    else
      redirect '/'
    end
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