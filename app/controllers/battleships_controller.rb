class BattleshipsController
  TUG = 'T'.freeze
  DESTROYER = 'D'.freeze
  SUBMARINE = 'S'.freeze
  BATTLESHIP = 'B'.freeze
  CRUISER   = 'C'.freeze

  def initialize # rubocop:disable Metrics/MethodLength
    @board = Array.new(10) { Array.new(10) }
    @new_board = @board.map {|row| row.map { 0 }}
    @random_number = Random.new
    @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
    init_x = @random_number.rand(50) % (@is_vertical ? 10 : 6)
    init_y = @random_number.rand(50) % (@is_vertical ? 6 : 10)

    # Arranging Cruiser pieces.
    for i in 0..4
      if @is_vertical
        @new_board[init_x][init_y + i] = CRUISER
      else
        @new_board[init_x + i][init_y] = CRUISER
      end
    end

    # Arranging Battleship pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      init_x = @random_number.rand(50) % (@is_vertical ? 10 : 7)
      init_y = @random_number.rand(50) % (@is_vertical ? 7 : 10)
      break if !((@new_board[init_x][init_y] != 0) ||
                (@is_vertical && ((@new_board[init_x][init_y + 1] != 0) ||
                (@new_board[init_x][init_y + 2] != 0) || (@new_board[init_x][init_y + 3] != 0))) ||
                (!@is_vertical && ((@new_board[init_x + 1][init_y] != 0) ||
                (@new_board[init_x + 2][init_y] != 0) || (@new_board[init_x + 3][init_y] != 0))))
    end

    if @is_vertical
      @new_board[init_x][init_y]     =
      @new_board[init_x][init_y + 1] =
      @new_board[init_x][init_y + 2] = @new_board[init_x][init_y + 3] = BATTLESHIP

    else
      @new_board[init_x][init_y]     =
      @new_board[init_x + 1][init_y] =
      @new_board[init_x + 2][init_y] = @new_board[init_x + 3][init_y] = BATTLESHIP
    end

    # Arranging Destroyer pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      init_x = @random_number.rand(50) % (@is_vertical ? 10 : 8)
      init_y = @random_number.rand(50) % (@is_vertical ? 8 : 10)
      break if !((@new_board[init_x][init_y] != 0) ||
                (@is_vertical &&
                        ((@new_board[init_x][init_y + 1] != 0) || (@new_board[init_x][init_y + 2] != 0))) ||
                (!@is_vertical &&
                        ((@new_board[init_x + 1][init_y] != 0) || (@new_board[init_x + 2][init_y] != 0))))
    end

    if @is_vertical
      @new_board[init_x][init_y]   = @new_board[init_x][init_y + 1] = @new_board[init_x][init_y + 2] = DESTROYER
    else
      @new_board[init_x][init_y]   = @new_board[init_x + 1][init_y] = @new_board[init_x + 2][init_y] = DESTROYER
    end

    # Arranging Submarine pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      init_x = @random_number.rand(50) % (@is_vertical ? 10 : 8)
      init_y = @random_number.rand(50) % (@is_vertical ? 8 : 10)
      break if !((@new_board[init_x][init_y] != 0) ||
                (@is_vertical &&
                        ((@new_board[init_x][init_y + 1] != 0) || (@new_board[init_x][init_y + 2] != 0))) ||
                (!@is_vertical &&
                        ((@new_board[init_x + 1][init_y] != 0) || (@new_board[init_x + 2][init_y] != 0))))

    end

    if @is_vertical
      @new_board[init_x][init_y]   = @new_board[init_x][init_y + 1] = @new_board[init_x][init_y + 2] = SUBMARINE

    else
      @new_board[init_x][init_y]   = @new_board[init_x + 1][init_y] = @new_board[init_x + 2][init_y] = SUBMARINE
    end

    # Arranging Tug pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      init_x = @random_number.rand(50) % (@is_vertical ? 10 : 9)
      init_y = @random_number.rand(50) % (@is_vertical ? 9 : 10)
      break if !((@new_board[init_x][init_y] != 0) ||
                (@is_vertical &&
                        ((@new_board[init_x][init_y + 1] != 0))) ||
                (!@is_vertical && ((@new_board[init_x + 1][init_y] != 0))))

    end

    if @is_vertical
      @new_board[init_x][init_y]   = @new_board[init_x][init_y + 1] = TUG

    else
      @new_board[init_x][init_y]   = @new_board[init_x + 1][init_y] = TUG
    end
  end

  def display
    for i in 0..9
      for j in 0..9
        if (@new_board[i][j] == 0)
          print '.'
        else
          print @new_board[i][j]
        end
      end
      puts
    end
    puts
  end
end
