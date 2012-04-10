class AddLinkUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :songs, :link, :unique => true
  end

  def self.down
    remove_index :songs, :link
  end
end
