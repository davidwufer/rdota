module Rdota
  class LobbyType < DotaApiObject
    @types = [
      "Invalid",
      "Public matchmaking",
      "Practise",
      "Tournament",
      "Tutorial",
      "Co-op with bots",
      "Team match",
      "Single Queue"
    ]

    class << self
      attr_reader :types
    end

    compare_equality_using :number

    def initialize(number)
      @number = number
    end

    def to_i
      number
    end

    def to_s
      LobbyType.types[number + 1]
    end

    private
      attr_reader :number
  end
end
