module Rdota
  class Player < DotaApiObject
    compare_equality_using_instance_variables
    attr_reader :account_id, :name, :hero_id, :team

    def initialize(args = {})
      @account_id = args['account_id']
      @name       = args['name']
      @hero_id    = args['hero_id']
      @team       = args['team']
    end
  end
end
