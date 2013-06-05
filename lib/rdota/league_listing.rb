module Rdota
  class LeagueListing < DotaApiObject
    compare_equality_using :leagues
    attr_reader :leagues

    def initialize(args = {})
      @leagues = args["result"]["leagues"].map { |league| League.new(league) }
    end
  end
end
