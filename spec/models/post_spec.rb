require 'spec_helper'
require 'Timecop'

describe Post do

  describe ".ordered_by" do
    it "should order by particular order parameter" do
      post1 = Factory.create(:post, :title => "Created First")
      post2 = Factory.create(:post, :title => "Created Second" , :created_at => Time.current + 1.day, :updated_at => Time.current + 1.day)
      order_parameter1 = 'created_at DESC'

      Post.ordered_by(order_parameter1).should == [post2, post1]
    end
  end

  describe "#date_to_string" do
    it 'should return the created_at date as a string' do
      Timecop.freeze(1998, 7, 25, 7, 23)
      post = Factory.create(:post)
      post.date_to_string.should == "25-07-1998"
    end
  end

  describe "#date_to_readable" do
    it 'should return the created_at date as a human readable string' do
      Timecop.freeze(1998, 7, 25, 7, 23)
      post = Factory.create(:post)
      post.date_to_readable.should == "25 July 1998"
    end
  end

  describe "#body_to_html" do
    it 'should return the body textile text as html' do
      post = Factory.create(:post, :body => "This is *my* text.")
      post.body_to_html.should == "<p>This is <strong>my</strong> text.</p>"
    end
  end

  describe "#title" do
    it 'should be present' do
      post = Factory.build(:post, :title => "")
      post.should_not be_valid
      post.errors[:title].should include("can't be blank")
    end
  end

  describe "#body" do
    it 'should be present' do
      post = Factory.build(:post, :body => "")
      post.should_not be_valid
      post.errors[:body].should include("can't be blank")
    end
  end
end
