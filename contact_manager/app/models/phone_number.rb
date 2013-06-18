class PhoneNumber < ActiveRecord::Base
  belongs_to :person
  attr_accessible :number, :person_id

  validates :person_id, presence: true
  validates :number, format: { with: /\A\d{10}\z/ }
end
