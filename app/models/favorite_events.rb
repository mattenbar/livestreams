class FavoriteEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event


  def self.favorite_events
    find_favorite_event_ids
    @favorite_events = @fav_event_ids.map { |id| FavoriteEvent.find_by(event_id: id)}
  end

  def self.find_favorite_event_ids
    @fav_event_ids = FavoriteEvent.all.map { |fav| fav.event_id }
  end

  def self.currrent_user_favorite_events
    
  end

end
