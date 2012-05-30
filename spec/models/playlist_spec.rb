require 'spec_helper'

describe Playlist do


    def song_link(random_id = (rand*10000).floor.to_s(16))
    "<object width=\"250\" height=\"40\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" id=\"gsSong801699067\" name=\"gsSong801699067\"><param name=\"movie\" value=\"http://grooveshark.com/songWidget.swf\" /><param name=\"wmode\" value=\"window\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"flashvars\" value=\"hostname=cowbell.grooveshark.com&songIDs=8016990&style=metal&p=0\" /><object type=\"application/x-shockwave-flash\" data=\"http://grooveshark.com/songWidget.swf\" width=\"250\" height=\"40\"><param name=\"wmode\" value=\"window\" /><param name=\"allowScriptAccess\" value=\"always\" /><param name=\"flashvars\" value=\"hostname=cowbell.grooveshark.com&songIDs=8016990&style=metal&p=0\" /><span>Conventional Wisdom by <a href=\"http://grooveshark.com/artist/Built+To+Spill/401595\" title=\"Built to Spill\">Built to Spill#{random_id}</a> on Grooveshark</span></object></object>"
    end	
  
    it "should add a song to the playlist" do
    	test_playlist = Playlist.new()
    	test_song = Song.new(:link => song_link)
    	
    	test_playlist.add(test_song)
    	
    	test_playlist.Song.first.song_id.should = test_song.song_id
    end
  
end
