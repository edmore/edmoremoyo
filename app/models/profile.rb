class Profile < ActiveRecord::Base
  validates_presence_of :summary, :skills, :experience, :education

end
