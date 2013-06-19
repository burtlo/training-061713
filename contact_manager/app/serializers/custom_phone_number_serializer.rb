class CustomPhoneNumberSerializer < ActiveModel::Serializer
  attributes :number, :formatted_number, :url

  def formatted_number
    matches = object.number.match(/(\d{3})(\d{3})(\d{4})/).to_a
    "(#{matches[1]}) #{matches[2]}-#{matches[3]}"
  end

  def url
    phone_number_url(object, format: :json)
  end
end
