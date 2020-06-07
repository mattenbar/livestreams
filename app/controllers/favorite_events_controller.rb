class FavoriteEventsController < ApplicationController

  post '/favorite-event/:event_id' do 
    fav = FavoriteEvent.new(params)
    fav.user_id = current_user.id
    fav.save
    redirect "/events/#{params[:event_id]}"
  end

  delete '/favorite-event/:event_id' do
    fav = FavoriteEvent.where(event_id: params[:event_id], user_id: current_user.id)
    fav.each {|fav| fav.destroy}
    redirect "/events/#{params[:event_id]}"
  end

end