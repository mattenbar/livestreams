class Event < ActiveRecord::Base

  def self.create_from_collection(events_array = nil)
    events_array ||= Scraper.scrape_npr
    events_array.each do |event_hash|
     self.new(event_hash)
    end
  end
end