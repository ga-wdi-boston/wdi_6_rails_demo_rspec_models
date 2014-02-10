require 'spec_helper'

describe Contact do
  it "is invalid without a first name" do
    expect(Contact.create(last_name: "Fisher", phone: "555-1212")).to_not be_valid
  end

  it "is invalid without a last name"  do
    expect(Contact.create(first_name: "David", phone: "555-1212")).to_not be_valid
  end

  it "is invalid without a phone" do
    expect(Contact.create(first_name: "David", last_name: "Fisher")).to_not be_valid
  end

  it "is invalid without a birthday" do
    expect(Contact.create(first_name: "David", last_name: "Fisher", phone: "555-1212")).to_not be_valid
  end

  describe "associations" do
    it { should have_many :notes }
  end

  # All tests for class method of 'born_on'
  describe ".born_on" do
    before :each do
      # Monday birthday people
      @chris = Contact.create(first_name: "Chris", last_name: "Clearfield", phone: "555-1212", birthday: "2014-02-10")
      @david = Contact.create(first_name: "David", last_name: "Fisher", phone: "555-1212", birthday: "2014-02-03")

      # Friday birthday people
      @kelly = Contact.create(first_name: "Kelly", last_name: "Sanders", phone: "555-1212", birthday: "2014-2-07")
    end
    it "should return an array of Contacts born on a day of the week" do
      expect(Contact.born_on("Monday")).to eq [@chris, @david]
      expect(Contact.born_on("friday")).to eq [@kelly]
    end
  end

  describe "#full_name" do
    it "should return the full name of a contact" do
      @david = Contact.create(first_name: "David", last_name: "Fisher", phone: "555-1212", birthday: "2014-02-03")
      expect(@david.full_name).to eq("David Fisher")
    end
  end

end
