module Rdota
  class League
    attr_reader :name, :leagueid, :description, :tournament_url

    def initialize(args = {})
      @name           = args["name"]
      @leagueid       = args["leagueid"]
      @description    = args["description"]
      @tournament_url = args["tournament_url"]
    end

    # TODO: Make all this comparable by mixing a module
    alias_method :eql?, :==
    def ==(object)
      self.class == object.class && attr == object.attr
    end

    protected
      def attr
        instance_variables
      end

  end
end
