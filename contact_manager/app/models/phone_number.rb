class PhoneNumber < ActiveRecord::Base
  belongs_to :person

  validates :person_id, presence: true
  validates :number, format: { with: /\A\d{10}\z/ }
end
