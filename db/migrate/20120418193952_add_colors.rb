class AddColors < ActiveRecord::Migration
  def self.up
    create_table :colors do |t|
      t.integer :red
      t.integer :blue
      t.integer :green
      t.integer :colorable_id
      t.string :colorable_type
      t.timestamps
    end
  end

  def self.down
     drop_table :colors
  end
end
