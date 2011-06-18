class Post < ActiveRecord::Base
  scope :ordered_by, lambda { |order_parameter| { :order => order_parameter }}

  def date_to_string
    created_at.strftime("%d-%m-%Y")
  end

  def date_to_readable
    created_at.strftime("%d %B %Y")
  end

end