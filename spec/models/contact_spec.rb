require 'spec_helper'
require 'timecop'

describe Contact do

  describe ".ordered_by" do
    it "should order by particular order parameter" do
      contact1 = FactoryGirl.create(:contact, :name => "Created First")
      contact2 = FactoryGirl.create(:contact, :name => "Created Second" , :created_at => Time.current + 1.day, :updated_at => Time.current + 1.day)
      order_parameter1 = 'created_at DESC'

      Contact.ordered_by(order_parameter1).should == [contact2, contact1]
    end
  end

  describe "#date_to_string" do
    it 'should return the created_at date as a string' do
      Timecop.freeze(1998, 7, 25, 7, 23)
      contact = FactoryGirl.create(:contact)
      contact.date_to_string.should == "25-07-1998"
    end
  end

  describe "#name" do
    it 'should be present' do
      contact = FactoryGirl.build(:contact, :name => "")
      contact.should_not be_valid
      contact.errors[:name].should include("can't be blank")
    end
  end

  describe "#email" do
    it 'should be present' do
      contact = FactoryGirl.build(:contact, :email => "")
      contact.should_not be_valid
      contact.errors[:email].should include("can't be blank")
    end

    it "should be in the correct format" do
      contact1 = FactoryGirl.build(:contact, :email => "etmoyo@test.com")
      contact2 = FactoryGirl.build(:contact, :email => "etmoyo@test")
      contact1.should be_valid
      contact2.should_not be_valid

      contact2.errors[:email].should include("is invalid")
    end
  end

  describe "#body" do
    it 'should be present' do
      contact = FactoryGirl.build(:contact, :body => "")
      contact.should_not be_valid
      contact.errors[:body].should include("can't be blank")
    end
  end


end
