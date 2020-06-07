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

  
end