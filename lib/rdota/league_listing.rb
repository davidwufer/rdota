require 'rdota/dota_api_object'

module Rdota
  class LeagueListing < DotaApiObject
    compare_equality_using :leagues
    attr_reader :leagues

    def initialize(args = {})
      @leagues = args["result"]["leagues"].map { |league| League.new(league) }
    end
  end

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
