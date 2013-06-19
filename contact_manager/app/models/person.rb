class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, :last_name, presence: true

  has_many :phone_numbers

  def name
    [ first_name, last_name ].join(" ")
  end

  # def as_json(context)
  #   { id: id, name: "#{first_name} #{last_name}" }
  # end

end
