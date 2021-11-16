module TicTacToe
    def player_choice
        print "Choose square number: "
        position = gets.chomp
        print "Choose X or O: "
        letter = gets.chomp
        [position, letter]
    end
end

class GameSquare
    attr_accessor :play
    def initialize(play=" ")
        @play = play
    end

    def visual
        "| #{@play} |"
    end
end

class Gameboard < GameSquare
    include TicTacToe
    attr_accessor :gameboard
    def initialize
        @gameboard = []
        9.times { |n| gameboard.push(GameSquare.new(n.to_s)) }
    end

    def visual
        visual_game = @gameboard.map { |square| square.visual}
        puts visual_game[0..2].join
        puts visual_game[3..5].join
        puts visual_game[6..8].join
    end

    def update_board
        current_choice = player_choice
        position = current_choice[0]
        letter = current_choice[1]
        for i in 0..8 do
            if i.to_s == position
                @gameboard[i].play = letter
            end
        end
    end
end

game_board = Gameboard.new()

game_board.visual
game_board.update_board
game_board.visual