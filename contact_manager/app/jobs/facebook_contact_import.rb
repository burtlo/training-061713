class FacebookContactImport
  @queue = :facebook_contact_import_queue

  # We pass in { user_id: NUMBER }
  def self.perform(params)

    puts "Starting to Performing Facebook Contact Import"
    sleep 3
    puts %{

      HAPPILY DOING THINGS FOR YOU

    }

    sleep 3
    # user = User.find(params[:user_id])

    # Connect to facebook
    # find all their contacts
    # import new contacts
    puts "Finished Performing Facebook Contact Import"

  end

end