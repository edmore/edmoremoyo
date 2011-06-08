require 'spec_helper'

describe Profile do
  before(:each) do
    @profile = Factory.create(:profile)
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

end
