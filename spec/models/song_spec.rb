# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  artist     :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Song do

  def link(random_id = (rand*10000).floor.to_s(16))
    "<object width=\"250\" height=\"40\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" id=\"gsSong801699067\" name=\"gsSong801699067\"><param name=\"movie\" value=\"http://grooveshark.com/songWidget.swf\" /><param name=\"wmode\" value=\"window\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"flashvars\" value=\"hostname=cowbell.grooveshark.com&songIDs=8016990&style=metal&p=0\" /><object type=\"application/x-shockwave-flash\" data=\"http://grooveshark.com/songWidget.swf\" width=\"250\" height=\"40\"><param name=\"wmode\" value=\"window\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"flashvars\" value=\"hostname=cowbell.grooveshark.com&songIDs=8016990&style=metal&p=0\" /><span>Conventional Wisdom by <a href=\"http://grooveshark.com/artist/Built+To+Spill/401595\" title=\"Built to Spill\">Built to Spill#{random_id}</a> on Grooveshark</span></object></object>"
  end

  it "should accept valid links" do
     valid_link_song = Song.new(:link => link)
     valid_link_song.should be_valid
  end

  it "should reject invalid links" do
    links = %w[user@foo,com user_at_foo.org example.user@foo.]
    links.each do |link|
      invalid_link_song = Song.new(:link => link)
      invalid_link_song.should_not be_valid
    end
  end
  
  it "should reject duplicate links" do
    # Put a song with given link into the database.
    repeat_link = link
    Song.create!(:link => repeat_link)
    song_with_duplicate_email = Song.new(:link => repeat_link)
    song_with_duplicate_email.should_not be_valid
  end

  describe "#average_color" do
    it "should return the average color for a song" do
      test_song = Song.create!(:link => link)
      Color.create!(:red => 30, :blue => 50, :green => 80, :song_id => test_song.id)
      Color.create!(:red => 90, :blue => 100, :green => 82, :song_id => test_song.id)
      test_song.average_color.should  == [60, 81, 75]
    end
  end
end
