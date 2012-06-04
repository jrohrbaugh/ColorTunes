module ApplicationHelper

  def logo
    logo = image_tag("/assets/logo.png", :alt => "Color Tunes", :class => "round")
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

end
