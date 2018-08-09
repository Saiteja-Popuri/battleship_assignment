class BattleshipsController
  TUG = 'T'.freeze
  DESTROYER = 'D'.freeze
  SUBMARINE = 'S'.freeze
  BATTLESHIP = 'B'.freeze
  CRUISER   = 'C'.freeze

  def initialize
    @board = Array.new(10) { Array.new(10) }
    @board = @board.map {|row| row.map { 0 }}
    @random_number = Random.new
    @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
    row_index = @random_number.rand(50) % (@is_vertical ? 10 : 6)
    column_index = @random_number.rand(50) % (@is_vertical ? 6 : 10)

    # Arranging Cruiser pieces.
    for i in 0..4
      if @is_vertical
        @board[row_index][column_index + i] = CRUISER
      else
        @board[row_index + i][column_index] = CRUISER
      end
    end

    # Arranging Battleship pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      row_index = @random_number.rand(50) % (@is_vertical ? 10 : 7)
      column_index = @random_number.rand(50) % (@is_vertical ? 7 : 10)
      break if !((@board[row_index][column_index] != 0) ||
                (@is_vertical && ((@board[row_index][column_index + 1] != 0) ||
                (@board[row_index][column_index + 2] != 0) || (@board[row_index][column_index + 3] != 0))) ||
                (!@is_vertical && ((@board[row_index + 1][column_index] != 0) ||
                (@board[row_index + 2][column_index] != 0) || (@board[row_index + 3][column_index] != 0))))
    end

    if @is_vertical
      @board[row_index][column_index]     =
      @board[row_index][column_index + 1] =
      @board[row_index][column_index + 2] = @board[row_index][column_index + 3] = BATTLESHIP

    else
      @board[row_index][column_index]     =
      @board[row_index + 1][column_index] =
      @board[row_index + 2][column_index] = @board[row_index + 3][column_index] = BATTLESHIP
    end

    # Arranging Destroyer pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      row_index = @random_number.rand(50) % (@is_vertical ? 10 : 8)
      column_index = @random_number.rand(50) % (@is_vertical ? 8 : 10)
      break if !((@board[row_index][column_index] != 0) ||
                (@is_vertical &&
                        ((@board[row_index][column_index + 1] != 0) || (@board[row_index][column_index + 2] != 0))) ||
                (!@is_vertical &&
                        ((@board[row_index + 1][column_index] != 0) || (@board[row_index + 2][column_index] != 0))))
    end

    if @is_vertical
      @board[row_index][column_index]   = @board[row_index][column_index + 1] = @board[row_index][column_index + 2] = DESTROYER
    else
      @board[row_index][column_index]   = @board[row_index + 1][column_index] = @board[row_index + 2][column_index] = DESTROYER
    end

    # Arranging Submarine pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      row_index = @random_number.rand(50) % (@is_vertical ? 10 : 8)
      column_index = @random_number.rand(50) % (@is_vertical ? 8 : 10)
      break if !((@board[row_index][column_index] != 0) ||
                (@is_vertical &&
                        ((@board[row_index][column_index + 1] != 0) || (@board[row_index][column_index + 2] != 0))) ||
                (!@is_vertical &&
                        ((@board[row_index + 1][column_index] != 0) || (@board[row_index + 2][column_index] != 0))))

    end

    if @is_vertical
      @board[row_index][column_index]   = @board[row_index][column_index + 1] = @board[row_index][column_index + 2] = SUBMARINE

    else
      @board[row_index][column_index]   = @board[row_index + 1][column_index] = @board[row_index + 2][column_index] = SUBMARINE
    end

    # Arranging Tug pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      row_index = @random_number.rand(50) % (@is_vertical ? 10 : 9)
      column_index = @random_number.rand(50) % (@is_vertical ? 9 : 10)
      break if !((@board[row_index][column_index] != 0) ||
                (@is_vertical &&
                        ((@board[row_index][column_index + 1] != 0))) ||
                (!@is_vertical && ((@board[row_index + 1][column_index] != 0))))

    end

    if @is_vertical
      @board[row_index][column_index]   = @board[row_index][column_index + 1] = TUG

    else
      @board[row_index][column_index]   = @board[row_index + 1][column_index] = TUG
    end
  end

  # Public: Prints the game board with all the ships.
  #
  # Returns nothing.
  def display
    for i in 0..9
      for j in 0..9
        if (@board[i][j] == 0)
          print '.'
        else
          print @board[i][j]
        end
      end
      puts
    end
    puts
  end
end
