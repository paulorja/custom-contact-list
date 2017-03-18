require 'rails_helper'

RSpec.describe Field, type: :model do

  it "should be valid" do
    subject.name = "name"
    expect(subject).to be_valid
  end

  it "should not be valid" do
    subject.name = ""
    expect(subject).to_not be_valid
  end

end