== COLOR TUNES ==

Color Tunes is a web application that creates music playlists centered around colors. Users can upload songs to the database using an embedded Grooveshark link. Then, when other users view the song, they will be able to select a color that they think matches the song. The average of all color "votes" will be computed and displayed as the background color of the song page. Finally, users will be able to select a color on the home page, which will generate a playlist of songs that have average colors in close proximity to the selected color.

== Current state of project

Color Tunes is currently in development. It is created using the Ruby on Rails framework, and the basic structure was adapted from Michael Hartl's Ruby on Rails Tutorial (http://ruby.railstutorial.org/). 

So far, the functionality for song submission has been added. Users can enter a Grooveshark link on the submit page, and the song will be added to the database. Instructions on how to obtain this link are displayed in a pop-up using the Lightbox plugin. The link is verified for presence, format (using a very long regular expression) and uniqueness. On the "show" page for songs, the embedded Grooveshark player will appear.

The color picker has also been added to the home page. This is an HTML-embedded Javascript applet that uses the Yahoo UI library (found at http://www.dynamicdrive.com/dynamicindex11/yuicolorpicker/). 

== Errors/Issues

- Uniqueness validation does not work correctly for Grooveshark links. Songs with duplicate links are not entered into the database, but they still throw a RecordNotUnique exception, rather than returning to the submission page. Using integration tests, I was able to deduce that this problem is due to the format of Grooveshark links. It is almost certain that the link is too long for uniqueness validation to work normally. When using Heroku, the error message displays correctly. This means this is a database issue related to string length.
	
- Currently, the HTML for the for the color picker applet is defined in the application helper. The included Javascript, images, and CSS are in their correct subdirectories of the public folder. The color picker shows up correctly on the home page, but when the definition is added to a song's "show" page, the stylesheets do not load.

- There may be a more efficient way to include the Color Picker code. Selection of colors requires use of variables within the code, which cannot be accessed in the current format (the entire code is defined as a string, and then converted to HTML using html_safe). One option is to include the entire code on both the home and show pages. This violates the principle of DRY, but it may be neccessary, especially because both pages use the color selection function differently. 

== Future Updates ==

- Fixing the errors described above

- Improve usability of Grooveshark embedding and link submission as much as possible.

- On the "show" page, the title and artist of the song should appear in the side box. This information can be obtained from the embedded link, and is always in the same part of the link, so it should be possible to extract.

- The box in the bottom corner of the color picker allows a selected color to be stored in a text box. This functionality can be slightly modified to allow the selected color to be submitted as a parameter in a method. 

From the show page, this will store the selected color in some sort of data structure (most likely a hash table) along with the colors selected by other users. The average color will then be calculated and stored as a variable. This color will then be displayed as the song's background. Average color should be fairly easy to compute, since colors are stored as 6-digit hex values, with two digits each representing red, green and blue values. This variable can be included in the stylesheets using a CSS extension such as SASS.

From the home page, selecting a color will generate a list of songs with average colors in the vicinity of that color (e.g. all colors with in 5 values of red, green, and blue). The proximity to the selected color will depend on the total number of songs in the database. Once a set of songs is found, songs will be randomly selected to play. 

- Eventually user accounts might become neccessary. Sign-up and sign-in should be as simple as possible, with only a username and password needed. Users would only have one "vote" for each song. If they re-vote for a song, the new color will be saved and the old color overwritten. 


