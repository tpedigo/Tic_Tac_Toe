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

    def check_board
        if @gameboard[0] != " "
            if (@gameboard[0].play == @gameboard[1].play && @gameboard[1].play == @gameboard[2].play) || (@gameboard[0].play == @gameboard[3].play && @gameboard[3].play == @gameboard[6].play) || (@gameboard[0].play == @gameboard[4].play && @gameboard[4].play == @gameboard[8].play)
                puts "Winner! #{@gameboard[0].play} got 3 in a row."
            end
        elsif @gameboard[1] != " "
            if (@gameboard[1].play == @gameboard[4].play && @gameboard[4].play == @gameboard[7].play)
                puts "Winner! #{@gameboard[4].play} got 3 in a row."
            end
        elsif @gameboard[2] != " "
            if (@gameboard[2].play == @gameboard[5].play && @gameboard[5].play == @gameboard[8].play) (@gameboard[2].play == @gameboard[4].play && @gameboard[4].play == @gameboard[6].play)
                puts "Winner! #{@gameboard[2].play} got 3 in a row."
            end
        elsif @gameboard[3] != " "
            if (@gameboard[3].play == @gameboard[4].play && @gameboard[4].play == @gameboard[5].play)
                puts "Winner! #{@gameboard[3].play} got 3 in a row."
            end
        elsif @gameboard[6] != " "
            if (@gameboard[6].play == @gameboard[7].play && @gameboard[7].play == @gameboard[8].play)
                puts "Winner! #{@gameboard[6].play} got 3 in a row."
            end
        end
    end
end

game_board = Gameboard.new()

game_board.visual
game_board.update_board
game_board.visual