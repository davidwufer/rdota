require 'rdota/dota_api_object'

module Rdota
  class League < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :name, :leagueid, :description, :tournament_url

    def initialize(args = {})
      @name           = args["name"]
      @leagueid       = args["leagueid"]
      @description    = args["description"]
      @tournament_url = args["tournament_url"]
    end

  end
end
