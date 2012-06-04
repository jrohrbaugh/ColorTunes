class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.text :link

      t.integer :avg_red
      t.integer :avg_green
      t.integer :avg_blue

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
