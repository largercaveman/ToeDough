module ApplicationHelper

  def full_title(title_in)
    if title_in.empty?
      return "ToeDough"
    else
      return "ToeDough - #{title_in}"
    end
  end

  def title(title_in)
    provide(:title, title_in)
  end

end
