module Rdota
  module ApiUrl
    ROOT_URL = "https://api.steampowered.com/"
    DOTA_ID = 570
    MATCHES ="IDOTA2Match_#{DOTA_ID}/"
    GAME = "IDOTA2_#{DOTA_ID}/"

    VERSION = "001/"

    # TODO: Attach Key
    # TODO: Attach Language
    def self.league_listing_url
      "#{ROOT_URL}#{MATCHES}GetLeagueListing/#{VERSION}"
    end
  end
end
