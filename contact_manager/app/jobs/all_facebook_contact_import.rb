class AllFacebookContactImport
  @queue = :all_facebook_contact_import_queue

  require 'ostruct'
  class User
    def self.all
      [ OpenStruct.new(id: 1), OpenStruct.new(id: 2), OpenStruct.new(id: 3)]
    end
  end

  def self.perform(params)
    User.all.each do |user|
      puts "Enqueuing facebook import for user: #{user.id}"
      Resque.enqueue(FacebookContactImport,user_id: user.id)
    end

  end

end