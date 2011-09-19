module ApplicationHelper
  def header(text)
    content_tag :div, :class => 'heading-bar clearfix' do
      content_tag :h1, text
    end
  end

  def random_description
    Profile::DESCRIPTION.sample
  end

  def page_title
    title = request.fullpath.split("/").reject(&:empty?)
    return "edmore_moyo" if title.blank?
    return "edmore_moyo" + " | " + title[0].titleize  unless title[1].present?
    "edmore_moyo" + " | " + title[0].titleize + " : " + title[1]
  end

end
