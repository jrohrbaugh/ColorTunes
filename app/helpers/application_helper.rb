module ApplicationHelper

  def logo
    logo = image_tag("logo.png", :alt => "Color Tunes", :class => "round")
  end

  # Return a title on a per-page basis.
  def title
    base_title = "Color Tunes"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def color_picker
  		"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"
			\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
		<html lang=\"en\" xml:lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\"
			xmlns:x2=\"http://www.w3.org/TR/xhtml2\"
			xmlns:role=\"http://www.w3.org/2005/01/wai-rdf/GUIRoleTaxonomy#\"
			xmlns:state=\"http://www.w3.org/2005/07/aaa\">
		<head>
		<link rel=\"stylesheet\" type=\"text/css\" href=\"stylesheets/blueprint/picker_screen.css\">
		<script type=\"text/javascript\" src=\"javascripts/ddcolorposter.js\"></script>
		<script type=\"text/javascript\" src=\"javascripts/YAHOO.js\" ></script>
		<script type=\"text/javascript2\" src=\"javascripts/log.js\" ></script>
		<script type=\"text/javascript\" src=\"javascripts/color.js\" ></script>

		<script type=\"text/javascript\" src=\"javascripts/event.js\" ></script>
		<script type=\"text/javascript\" src=\"javascripts/dom.js\" ></script>
		<script type=\"text/javascript\" src=\"javascripts/animation.js\" ></script>
		<script type=\"text/javascript\" src=\"javascripts/picker_dragdrop.js\" ></script>

		<script type=\"text/javascript\" src=\"javascripts/slider.js\" ></script>
		<script type=\"text/javascript\">

			var hue;
			var picker;
			//var gLogger;
			var dd1, dd2;
			var r, g, b;

			function init() {
				if (typeof(ygLogger) != \"undefined\")
					ygLogger.init(document.getElementById(\"logDiv\"));
			pickerInit();
				ddcolorposter.fillcolorbox(\"colorfield1\", \"colorbox1\") //PREFILL \"colorbox1\" with hex value from \"colorfield1\"
				ddcolorposter.fillcolorbox(\"colorfield2\", \"colorbox2\") //PREFILL \"colorbox1\" with hex value from \"colorfield1\"
    	}

    	// Picker ---------------------------------------------------------

    	function pickerInit() {
			hue = YAHOO.widget.Slider.getVertSlider(\"hueBg\", \"hueThumb\", 0, 180);
			hue.onChange = function(newVal) { hueUpdate(newVal); };

			picker = YAHOO.widget.Slider.getSliderRegion(\"pickerDiv\", \"selector\",
					0, 180, 0, 180);
			picker.onChange = function(newX, newY) { pickerUpdate(newX, newY); };

			hueUpdate();

			dd1 = new YAHOO.util.DD(\"pickerPanel\");
			dd1.setHandleElId(\"pickerHandle\");
			dd1.endDrag = function(e) {
				// picker.thumb.resetConstraints();
				// hue.thumb.resetConstraints();
       		};
		}

		executeonload(init);

		function pickerUpdate(newX, newY) {
			pickerSwatchUpdate();
		}


		function hueUpdate(newVal) {

			var h = (180 - hue.getValue()) / 180;
			if (h == 1) { h = 0; }

			var a = YAHOO.util.Color.hsv2rgb( h, 1, 1);

			document.getElementById(\"pickerDiv\").style.backgroundColor =
				\"rgb(\" + a[0] + \", \" + a[1] + \", \" + a[2] + \")\";

			pickerSwatchUpdate();
		}

		function pickerSwatchUpdate() {
			var h = (180 - hue.getValue());
			if (h == 180) { h = 0; }
			document.getElementById(\"pickerhval\").value = (h*2);

			h = h / 180;

			var s = picker.getXValue() / 180;
			document.getElementById(\"pickersval\").value = Math.round(s * 100);

			var v = (180 - picker.getYValue()) / 180;
			document.getElementById(\"pickervval\").value = Math.round(v * 100);

			var a = YAHOO.util.Color.hsv2rgb( h, s, v );

			document.getElementById(\"pickerSwatch\").style.backgroundColor =
				\"rgb(\" + a[0] + \", \" + a[1] + \", \" + a[2] + \")\";

			document.getElementById(\"pickerrval\").value = a[0];
			document.getElementById(\"pickergval\").value = a[1];
			document.getElementById(\"pickerbval\").value = a[2];
			var hexvalue = document.getElementById(\"pickerhexval\").value =
				YAHOO.util.Color.rgb2hex(a[0], a[1], a[2]);
				ddcolorposter.initialize(a[0], a[1], a[2], hexvalue)
			}

		</script>


		<!--[if gte IE 5.5000]>
		<script type=\"text/javascript\">

		function correctPNG() // correctly handle PNG transparency in Win IE 5.5 or higher.
	    {
		   for(var i=0; i<document.images.length; i++)
	       {
			  var img = document.images[i]
			  var imgName = img.src.toUpperCase()
			  if (imgName.substring(imgName.length-3, imgName.length) == \"PNG\")
		     {
				 var imgID = (img.id) ? \"id='\" + img.id + \"' \" : \"\"
				 var imgClass = (img.className) ? \"class='\" + img.className + \"' \" : \"\"
				 var imgTitle = (img.title) ? \"title='\" + img.title + \"' \" : \"title='\" + img.alt + \"' \"
				 var imgStyle = \"display:inline-block;\" + img.style.cssText
				 if (img.align == \"left\") imgStyle = \"float:left;\" + imgStyle
				 if (img.align == \"right\") imgStyle = \"float:right;\" + imgStyle
	 			 if (img.parentElement.href) imgStyle = \"cursor:hand;\" + imgStyle
				 var strNewHTML = \"<span \" + imgID + imgClass + imgTitle
				 + \" style=\"\" + \"width:\" + img.width + \"px; height:\" + img.height + \"px;\" + imgStyle + \";\"
			     + \"filter:progid:DXImageTransform.Microsoft.AlphaImageLoader\"
				 + \"(src=\'\" + img.src + \"\', sizingMethod='scale');\"></span>\"
				 img.outerHTML = strNewHTML
				 i = i-1
 			  }
     	   }
   	    }

     	  YAHOO.util.Event.addListener(window, \"load\", correctPNG);

		</script>
		<![endif]-->
		</head>
		<body>

  		  <h3>Pick a Color!</h3>
   		   <p>

  	      </p>


   	     <div id=\"pickerPanel\" class=\"dragPanel\">
   	         <h4 id=\"pickerHandle\">&nbsp;</h4>
   	         <div id=\"pickerDiv\">
              <img id=\"pickerbg\" src=\"images/pickerbg.png\" alt=\"\">
   	           <div id=\"selector\"><img src=\"images/select.gif\"></div>
   	         </div>

   	          <div id=\"hueBg\">
   	           <div id=\"hueThumb\"><img src=\"images/hline.png\"></div>
  	          </div>

    	        <div id=\"pickervaldiv\">
   	             <form name=\"pickerform\" onsubmit=\"return pickerUpdate()\">
   	             <br />
   	             R <input name=\"pickerrval\" id=\"pickerrval\" type=\"text\" value=\"0\" size=\"3\" maxlength=\"3\" />
  	              H <input name=\"pickerhval\" id=\"pickerhval\" type=\"text\" value=\"0\" size=\"3\" maxlength=\"3\" />
   	             <br />
   	             G <input name=\"pickergval\" id=\"pickergval\" type=\"text\" value=\"0\" size=\"3\" maxlength=\"3\" />
   	             S <input name=\"pickergsal\" id=\"pickersval\" type=\"text\" value=\"0\" size=\"3\" maxlength=\"3\" />
   	             <br />
   	             B <input name=\"pickerbval\" id=\"pickerbval\" type=\"text\" value=\"0\" size=\"3\" maxlength=\"3\" />
   	             V <input name=\"pickervval\" id=\"pickervval\" type=\"text\" value=\"0\" size=\"3\" maxlength=\"3\" />
   	             <br />
   	             <br />
    	            # <input name=\"pickerhexval\" id=\"pickerhexval\" type=\"text\" value=\"0\" size=\"6\" maxlength=\"6\" />
    	            <br />

    	            </form>
    	        </div>

   	         <div id=\"pickerSwatch\">&nbsp;</div>
   	     </div>


			</div>

 	   	 </div>
	 	 </div>


		<form>
		# <input type=\"text\" id=\"colorfield1\" onFocus=\"ddcolorposter.echocolor(this, 'colorbox1')\"> <span id=\"colorbox1\" class=\"colorbox\">____</span> <br />
		# <input type=\"text\" id=\"colorfield2\" onFocus=\"ddcolorposter.echocolor(this, 'colorbox2')\"> <span id=\"colorbox2\" class=\"colorbox\">____</span>
		</form>
	
		</body>
		</html>"

	end
end
