module ApplicationHelper
  def header(text)
    content_tag :div, :class => 'heading-bar clearfix' do
      content_tag :h1, text
    end
  end

  def random_description
    Profile::DESCRIPTION.sample
  end

end
