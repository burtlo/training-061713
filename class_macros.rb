module HasAttributes

  # after you have call include
  def self.included(base)
    # puts "Hey #{self} has just been included by: #{base}"
    # base class extend class methods
    # puts "Now you should extend the class you need"
    base.extend ClassMethods
  end

  def self.extended(base)

  end

  # { title: 'War and Peace', ... }
  def initialize(hash)
    @hash = hash
  end

  module ClassMethods

    def attribute(name,options={})
      puts "Adding attribute: #{name}"
      define_method name do
        @hash[name] || options[:default]
      end

      define_method "#{name}=" do |value|
        @hash[name] = value
      end

      attribute_list.push(name)
    end

    def attribute_list
      @attribute_list ||= []
    end

    def attributes(*names)
      names.each {|name| attribute(name) }
    end

  end
end

class Article

  def self.all
    [ new({}), new({}) ]
  end

  include HasAttributes

  attribute :title, default: "World War Z"
  attributes :author, :publish_date

  def to_json
    hash = {}

    Article.attribute_list.each do |attribute|
      puts "Storing in hash #{attribute} #{send(attribute)}"
      hash[attribute] = send(attribute)
    end
    hash
  end

end

class Gallery
  include HasAttributes

  attributes :title
end

# puts Article.all

article = Article.new author: "Tolstoy", publish_date: "1/1/1901"
# puts article.title
# article.title= "Anne Frank, The Diary Of"
# puts article.title
# puts article.author
puts article.to_json
puts Article.attribute_list

# gallery = Gallery.new title: "Kim Kardasian Baby Bump!"
# puts gallery.title
# puts Gallery.attribute_list