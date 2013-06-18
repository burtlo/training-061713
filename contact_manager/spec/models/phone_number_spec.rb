require 'spec_helper'

describe PhoneNumber do

  let(:phone_number) do
    phone = PhoneNumber.new number: "1234567890"
    phone.person_id = 1
    phone
  end

  it "is valid" do
    expect(phone_number).to be_valid
  end

  it "is invalid without a phone number" do
    phone_number.number = nil
    expect(phone_number).to be_invalid
  end

  it "is invalid with an invalid phone number" do
    phone_number.number = "DO NOT CALL ME"
    expect(phone_number).to be_invalid
  end

  it "must have a reference to a person" do
    phone_number.person_id = nil
    expect(phone_number).to be_invalid
  end

  it "is associated with a person" do
    expect(phone_number).to respond_to(:person)
  end
end
