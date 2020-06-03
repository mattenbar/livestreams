class EventController < ApplicationController

  get '/all' do 
    @events = Event.all
    erb :'events/all'
  end

  get '/new' do
    erb :'events/new'
  end

end