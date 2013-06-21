class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates :first_name, :last_name, presence: true

  has_many :phone_numbers

  after_save :clear_caches
  after_destroy :clear_caches

  def clear_caches
    puts %{

      CLEARING CACHE FROM THE MODEL

    }
    Rails.cache.delete('people-all')
  end

  def name
    [ first_name, last_name ].join(" ")
  end

  # def as_json(context)
  #   { id: id, name: "#{first_name} #{last_name}" }
  # end

end
