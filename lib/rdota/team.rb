module Rdota
  class Team < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :team_name, :team_id, :team_logo, :complete

    def initialize(args = {})
      @team_name = args["team_name"]
      @team_id   = args["team_id"]
      @team_logo = args["team_logo"]
      @complete  = args["complete"]
    end
  end
end
