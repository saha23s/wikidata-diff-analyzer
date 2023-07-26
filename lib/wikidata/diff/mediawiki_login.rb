require 'mediawiki_api'
# to load env variable
require 'dotenv/load'

class MediawikiLogin
    def self.mediawiki_login
      client = MediawikiApi::Client.new('https://www.mediawiki.org/w/api.php')
      begin
        client.log_in(ENV['MEDIAWIKI_USERNAME'], ENV['MEDIAWIKI_PASSWORD'])
        client.logged_in?  # Return whether login was successful
      rescue MediawikiApi::LoginError => e
        puts "Login failed: #{e.message}"
        return false
      end
    end
  end
