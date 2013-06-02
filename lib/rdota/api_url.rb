module Rdota
  module ApiUrl
    BASE_URL = "https://api.steampowered.com/"
    DOTA_ID = 570
    MATCHES ="IDOTA2Match_#{DOTA_ID}/"
    GAME = "IDOTA2_#{DOTA_ID}/"

    VERSION = "001"

    def self.league_listing_url
      "#{BASE_URL}#{MATCHES}GetLeagueListing/#{VERSION}"
    end
  end
end
