module Rdota
  class LeagueListing
    attr_reader :leagues
    alias_method :eql?, :==

    def initialize(args = {})
      @leagues = args["result"]["leagues"].map { |league| League.new(league) }
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
