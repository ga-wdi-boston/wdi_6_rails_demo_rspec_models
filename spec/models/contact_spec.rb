require 'spec_helper'

describe Contact do
  it "is invalid without a first name" do
    expect(Contact.create(last_name: "Fisher", phone: "555-1212")).to_not be_valid
  end

  it "is invalid without a last name"  do
    expect(Contact.create(first_name: "David", phone: "555-1212")).to_not be_valid
  end
end
