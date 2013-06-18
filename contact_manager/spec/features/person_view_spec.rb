require 'spec_helper'

describe 'the person view' do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: "1235551234")
    person.phone_numbers.create(number: "1235555678")
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it "has a link to add a new phone number" do
    expect(page).to have_link("Add phone number",
      href: new_phone_number_path(person_id: person.id))
  end

  it "adds a new phone number" do
    page.click_link('Add phone number')
    page.fill_in('Number', with: '9999991111')
    page.click_button('Create Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('9999991111')
  end

  it "has links to edit the phone numbers" do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('edit',href: edit_phone_number_path(phone))
    end
  end

  it "edits a phone number successfully" do
    phone = person.phone_numbers.first
    old_number = phone.number
    new_number = '2345678901'

    page.find("#edit-phone-#{phone.id}").click
    page.fill_in('Number', with: new_number)
    page.click_button('Update Phone number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content(new_number)
    expect(page).not_to have_content(old_number)
  end

  it "has links to delete the phone numbers" do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('delete',href: phone_number_path(phone))
    end
  end

  it "delete a phone number successfully" do
    phone = person.phone_numbers.first
    old_number = phone.number

    page.find("#delete-phone-#{phone.id}").click
    expect(current_path).to eq(person_path(person))
    expect(page).not_to have_content(old_number)
  end
end