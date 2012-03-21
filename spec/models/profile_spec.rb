require 'spec_helper'

describe Profile do
  before(:each) do
    @profile = FactoryGirl.create(:profile)
  end

  describe "#summary" do
    it "should be present" do
      @profile.update_attribute(:summary, "")
      @profile.should_not be_valid
      @profile.errors[:summary].should include("can't be blank")
    end
  end

  describe "#skills" do
    it "should be present" do
      @profile.update_attribute(:skills, "")
      @profile.should_not be_valid
      @profile.errors[:skills].should include("can't be blank")
    end
  end

  describe "#experience" do
    it "should be present" do
      @profile.update_attribute(:experience, "")
      @profile.should_not be_valid
      @profile.errors[:experience].should include("can't be blank")
    end
  end

  describe "#education" do
    it "should be present" do
      @profile.update_attribute(:education, "")
      @profile.should_not be_valid
      @profile.errors[:education].should include("can't be blank")
    end
  end

  describe "#summary_to_html" do
    it 'should return the profile summary textile text as html' do
      profile = FactoryGirl.create(:profile, :summary => "This is *my* text.")
      profile.summary_to_html.should == "<p>This is <strong>my</strong> text.</p>"
    end
  end
  describe "#skills_to_html" do
    it 'should return the profile summary textile text as html' do
      profile = FactoryGirl.create(:profile, :skills => "This is *my* text.")
      profile.skills_to_html.should == "<p>This is <strong>my</strong> text.</p>"
    end
  end
  describe "#experience_to_html" do
    it 'should return the profile summary textile text as html' do
      profile = FactoryGirl.create(:profile, :experience => "This is *my* text.")
      profile.experience_to_html.should == "<p>This is <strong>my</strong> text.</p>"
    end
  end
  describe "#education_to_html" do
    it 'should return the profile summary textile text as html' do
      profile = FactoryGirl.create(:profile, :education => "This is *my* text.")
      profile.education_to_html.should == "<p>This is <strong>my</strong> text.</p>"
    end
  end

end
