class TwitterContactImport
  @queue = :twitter_contact_import_queue

  # We pass in { "user_id" => NUMBER }
  def self.perform(params)

    puts "Starting to Performing Twitter Contact Import #{params["retry_attempt"].to_i}"
    sleep 3
    puts %{

      HAPPILY DOING THINGS FOR YOU

    }
    fail

    sleep 3
    # user = User.find(params["user_id"])

    # Connect to Twitter
    # find all their contacts
    # import new contacts
    puts "Finished Performing Twitter Contact Import"

  rescue
    puts "Failed and retrying Attempt ##{params["retry_attempt"].to_i}"
    new_params = { "user_id" => params["user_id"], "retry_attempt" => (params["retry_attempt"].to_i + 1) }
    if params["retry_attempt"].to_i < 3
      Resque.enqueue(self,new_params)
    else
      fail
    end
  end

end