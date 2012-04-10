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

  before(:each) do
    @attr = { :link => "<object width=\"250\" height=\"40\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" id=\"gsSong801699067\" name=\"gsSong801699067\"><param name=\"movie\" value=\"http://grooveshark.com/songWidget.swf\" /><param name=\"wmode\" value=\"window\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"flashvars\" value=\"hostname=cowbell.grooveshark.com&songIDs=8016990&style=metal&p=0\" /><object type=\"application/x-shockwave-flash\" data=\"http://grooveshark.com/songWidget.swf\" width=\"250\" height=\"40\"><param name=\"wmode\" value=\"window\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"flashvars\" value=\"hostname=cowbell.grooveshark.com&songIDs=8016990&style=metal&p=0\" /><span>Conventional Wisdom by <a href=\"http://grooveshark.com/artist/Built+To+Spill/401595\" title=\"Built to Spill\">Built to Spill</a> on Grooveshark</span></object></object>" }
  end
  
  it "should accept valid links" do
     valid_link_song = Song.new(@attr)
     valid_link_song.should be_valid
  end

  it "should reject invalid links" do
    links = %w[user@foo,com user_at_foo.org example.user@foo.]
    links.each do |link|
      invalid_link_song = Song.new(@attr.merge(:link => link))
      invalid_link_song.should_not be_valid
    end
  end
  
  it "should reject duplicate links" do
    # Put a song with given link into the database.
    Song.create!(@attr)
    song_with_duplicate_email = Song.new(@attr)
    song_with_duplicate_email.should_not be_valid
  end
end
