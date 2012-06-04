== COLOR TUNES ==

Color Tunes is a web application that creates music playlists centered around colors. Users can upload songs to the database using an embedded Grooveshark link. Then, when other users view the song, they will be able to select a color that they think matches the song. The average of all color "votes" will be computed and displayed as the background color of the song page. Finally, users will be able to generate a playlist of songs that have average colors in close proximity to a color selected by the user.

== Current state of project

Color Tunes is currently in development. It is created using the Ruby on Rails framework, and the basic structure was adapted from Michael Hartl's Ruby on Rails Tutorial (http://ruby.railstutorial.org/). 

So far, the functionality for song submission, color voting, and playlist creation has been added. Users can enter a Grooveshark link on the submit page, and the song will be added to the database. Instructions on how to obtain this link are displayed in a pop-up using the Lightbox plugin. The link is verified for presence, format (using a very long regular expression) and uniqueness. On the "show" page for songs, the embedded Grooveshark player will appear.

The "show" page also contains the color. This is an HTML-embedded Javascript applet that uses the Yahoo UI library (found at http://www.dynamicdrive.com/dynamicindex11/yuicolorpicker/). The user can select a color, and press the "vote" button to add that color to the song's list of colors. The background color of the show page will be the average of all colors submitted for that particular song.

The home page also links to a "start listening" page, which also features the color picker. Selecting a color here will generate a playlist of songs that have average colors in the vicinity of that color. This process uses an algorithm that will build a 20-song playlist. In order to have some degree of randomness, these songs are selected from a larger "block" of colors. The block will expand outward from the selected color until it contains a specified number of songs (5% of the songs in the database). 20 songs will then be randomly selected from this block. After the playlist is created, the user will be then redirected to the first 

== Errors/Issues
	
- Assets do not load correctly on Heroku. This is an issue with the asset pipeline

== Future Updates ==

- Fixing the errors described above

- Allow users to cycle through playlists with a "next song" button

- Improve usability of Grooveshark embedding and link submission as much as possible. Explore the Grooveshark API.

- On the "show" page, the title and artist of the song should appear in the side box. This information can be obtained from the embedded link, and is always in the same part of the link, so it should be possible to extract.

- The color picker applet could be stored in a helper, in order to make the code more readable

- Using the HSV system instead of RGB may yield a better distribution of colors

- A database seed should be created to automatically add a large number of songs into the application, and then assign one random color to each song

- Voting for a color should not pause the current song

- Each user should only be able to vote on a song once. If they vote again, their previous vote should be replaced.


