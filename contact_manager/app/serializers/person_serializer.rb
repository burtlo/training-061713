class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number_count
  has_many :phone_numbers, serializer: CustomPhoneNumberSerializer

  def phone_number_count
    object.phone_numbers.count
  end

  def name
    "#{object.first_name} #{object.last_name}"
  end
end
