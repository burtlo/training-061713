class PhoneNumber < ActiveRecord::Base
  belongs_to :person
  attr_accessible :number
end
