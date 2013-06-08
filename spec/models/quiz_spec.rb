require File.dirname(__FILE__) + '/../spec_helper'

describe Quiz do
  it "should be valid" do
    Quiz.new.should be_valid
  end
end
