module ApplicationHelper

  def title=(text)
    content_for(:title, text)
  end

  def title
    content_for(:title) || 'Untitled'
  end

  def formatted_title
    if content_for?(:title)
      format_for_title(content_for(:title), application_name)
    else
      application_name
    end
  end

  def format_for_title(*pieces)
    pieces.join(' - ')
  end

  def application_name
    'SweetSuite'
  end


end
