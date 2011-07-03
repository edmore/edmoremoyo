class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :body
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i

  scope :ordered_by, lambda { |order_parameter| { :order => order_parameter }}

  def date_to_string
    created_at.strftime("%d-%m-%Y")
  end

end
