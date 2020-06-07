class Event < ActiveRecord::Base
  belongs_to :user
  has_many :favorites

  
  validates :date, presence: true

  def self.create_genres_array
    @@all_genres_array = Event.all.map do |event_obj|
        event_obj.genre
    end

    @@all_genres_array = @@all_genres_array.uniq.sort
  end

  def self.all_genres
    @@all_genres_array
  end


  def self.find_events_from_favorites
    @favorite_events = favorite_events.map do |fav| 
      if fav.event_id != nil
        Event.find_by(id: fav.event_id)
      end
    end
    @favorite_events.compact
  end

  def self.favorite_events
    find_favorite_event_ids
    @favorite_events = @fav_event_ids.map { |id| FavoriteEvent.find_by(event_id: id) }
  end

  def self.find_favorite_event_ids
    @fav_event_ids = FavoriteEvent.all.map { |fav| fav.event_id }
  end

  

  
end