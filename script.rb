
class GameSquare
    def initialize(play=" ")
        @play = play
    end

    def visual
        "| #{@play} |"
    end
end

class Gameboard < GameSquare
    attr_accessor :gameboard
    def initialize
        @gameboard = []
        9.times { gameboard.push(GameSquare.new()) }
    end

    def visual
        visual_game = @gameboard.map { |square| square.visual}
        puts visual_game[0..2].join
        puts visual_game[3..5].join
        puts visual_game[6..8].join
    end
end

game_board = Gameboard.new()

game_board.visual