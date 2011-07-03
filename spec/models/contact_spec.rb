require 'spec_helper'
require 'Timecop'

describe Contact do

  describe ".ordered_by" do
    it "should order by particular order parameter" do
      contact1 = Factory.create(:contact, :name => "Created First")
      contact2 = Factory.create(:contact, :name => "Created Second" , :created_at => Time.current + 1.day, :updated_at => Time.current + 1.day)
      order_parameter1 = 'created_at DESC'

      Contact.ordered_by(order_parameter1).should == [contact2, contact1]
    end
  end

  describe "#date_to_string" do
    it 'should return the created_at date as a string' do
      Timecop.freeze(1998, 7, 25, 7, 23)
      contact = Factory.create(:contact)
      contact.date_to_string.should == "25-07-1998"
    end
  end

end
