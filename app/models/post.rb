class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  scope :ordered_by, lambda { |order_parameter| { :order => order_parameter }}
  before_save :create_permalink

  def date_to_string
    created_at.strftime("%d-%m-%Y")
  end

  def date_to_readable
    created_at.strftime("%d %B %Y")
  end

  #overrides the default parameter which is the :id
  def to_param
    title.parameterize
  end

  private
  def create_permalink
    self.permalink = title.parameterize
  end

end
