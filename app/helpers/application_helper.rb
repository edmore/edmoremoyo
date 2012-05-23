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
    "edmore_moyo" + " | " + title[0].titleize + " : " + title[1].titleize
  end

  def copyright_year
    Time.current.year
  end

  def with_project(options = {})
    options.reverse_merge! :user => "edmore", :branch => "master"
    g = Github::Commit.new(options)
    yield (g) if block_given?
  end
end
