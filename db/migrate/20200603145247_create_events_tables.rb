class CreateEventsTables < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :date
      t.string :time
      t.string :name
      t.string :genre
      t.string :link
    end

  end
end
