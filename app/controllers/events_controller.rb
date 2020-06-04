class EventController < ApplicationController

  get '/event' do 
    @events = Event.all
    erb :'events/all'
  end

  get '/event/new' do
    erb :'events/new'
  end

  post '/event/new' do
    event = Event.new(params[:event])
    event.user_id = current_user.id
    event.save
    redirect "/event/#{event.id}"
  end

  get '/event/:id' do
    id = params[:id]
    @event = Event.find(id)
    erb :'/events/show'
  end

  #edit
  get '/event/:id/edit' do
    @event = Event.find_by(id: params[:id])
    erb :'events/edit'
  end

  #update
  put '/event/:id' do
    event = Event.find_by(id: params[:id])
    event.update(params[:event])
    redirect to "/event/#{event.id}"
  end


  delete '/event/:id' do
    event = Event.find_by(id: params[:id])
    event.destroy
    redirect to "/event"
  end
end