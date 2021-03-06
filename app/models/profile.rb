class Profile < ActiveRecord::Base
  validates_presence_of :summary, :skills, :experience, :education

  def summary_to_html
    RedCloth.new(summary).to_html
  end

  def skills_to_html
    RedCloth.new(skills).to_html
  end

  def experience_to_html
    RedCloth.new(experience).to_html
  end

  def education_to_html
    RedCloth.new(education).to_html
  end

end
