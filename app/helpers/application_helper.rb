module ApplicationHelper
  def header(text)
    content_tag :div, :class => 'heading-bar clearfix' do
      content_tag :h1, text
    end
  end

  def copyright_year
    Time.current.year
  end
end
