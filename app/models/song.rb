# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  link       :string(1000)
#  created_at :datetime
#  updated_at :datetime
#

class Song < ActiveRecord::Base
  attr_accessible :link, :name
  
  song_regex = /\A(<object width="250" height="40" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="gsSong)[\d]+(" name="gsSong)[\d]+("><param name="movie" value="http:\/\/grooveshark.com\/songWidget.swf" \/><param name="wmode" value="window" \/><param name="allowScriptAccess" value="always" \/><param name="flashvars" value="hostname=cowbell.grooveshark.com&songIDs=)[\d]+(&style=metal&p=0" \/><object type="application\/x-shockwave-flash" data="http:\/\/grooveshark.com\/songWidget.swf" width="250" height="40"><param name="wmode" value="window" \/><param name="allowScriptAccess" value="always" \/><param name="flashvars" value="hostname=cowbell.grooveshark.com&songIDs=)[\d]+(&style=metal&p=0" \/><span>).+(<a href="http:\/\/grooveshark.com\/artist\/).+(\/)[\d]+(" title=").+(">).+(<\/a> on Grooveshark<\/span><\/object><\/object>)\z/
  
  has_many :colors, :as => :colorable
  has_and_belongs_to_many :playlists


  validates :link, :presence   => true,
  				   :format     => { :with => song_regex},
  				   :uniqueness => true

  def average_color
    [:red, :green, :blue].map{ |c| colors.average(c).to_i }
  end
  def average_color_hex
    "#" + average_color.map{ |c| c.to_s(16).rjust(2,"0") }.join
  end
end
