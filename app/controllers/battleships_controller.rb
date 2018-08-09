class BattleshipsController
  TUG = 'T'.freeze
  DESTROYER = 'D'.freeze
  SUBMARINE = 'S'.freeze
  BATTLESHIP = 'B'.freeze
  CRUISER   = 'C'.freeze

  def initialize
  	@board = Array.new(10){Array.new(10)}
  	@new_board = @board.map{|row| row.map{ 0 }}
  	@random_number = Random.new
  	@is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
    initX = @random_number.rand(50) % (@is_vertical ? 10 : 6)
    initY = @random_number.rand(50) % (@is_vertical ? 6 : 10)

    # Arranging Cruiser pieces.
    for i in 0..4
     if (@is_vertical)
       @new_board[initX][initY+i] = CRUISER
     else
       @new_board[initX+i][initY] = CRUISER
     end
    end
   
   # Arranging Battleship pieces.
   loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      initX = @random_number.rand(50) % (@is_vertical ? 10 : 7)
      initY = @random_number.rand(50) % (@is_vertical ? 7 : 10)
      break if !((@new_board[initX][initY] != 0) ||
                (@is_vertical &&
                        ((@new_board[initX][initY+1] != 0) || (@new_board[initX][initY+2] != 0) || (@new_board[initX][initY+3] != 0))) ||
                (!@is_vertical &&
                        ((@new_board[initX+1][initY] != 0) || (@new_board[initX+2][initY] != 0) || (@new_board[initX+3][initY] != 0))))
   	
    end

    if (@is_vertical)
      @new_board[initX][initY] = @new_board[initX][initY+1] = @new_board[initX][initY+2] = @new_board[initX][initY+3] = BATTLESHIP
        
    else
      @new_board[initX][initY] = @new_board[initX+1][initY] = @new_board[initX+2][initY] = @new_board[initX+3][initY] = BATTLESHIP
    end
    
    # Arranging Destroyer pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      initX = @random_number.rand(50) % (@is_vertical ? 10 : 8)
      initY = @random_number.rand(50) % (@is_vertical ? 8 : 10)
      break if !((@new_board[initX][initY] != 0) ||
                (@is_vertical &&
                        ((@new_board[initX][initY+1] != 0) || (@new_board[initX][initY+2] != 0))) ||
                (!@is_vertical &&
                        ((@new_board[initX+1][initY] != 0) || (@new_board[initX+2][initY] != 0))))
   	
    end

    if (@is_vertical)
      @new_board[initX][initY]   = @new_board[initX][initY+1] = @new_board[initX][initY+2] = DESTROYER
        
    else
      @new_board[initX][initY]   = @new_board[initX+1][initY] = @new_board[initX+2][initY] = DESTROYER
    end


    # Arranging Submarine pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      initX = @random_number.rand(50) % (@is_vertical ? 10 : 8)
      initY = @random_number.rand(50) % (@is_vertical ? 8 : 10)
      break if !((@new_board[initX][initY] != 0) ||
                (@is_vertical &&
                        ((@new_board[initX][initY+1] != 0) || (@new_board[initX][initY+2] != 0))) ||
                (!@is_vertical &&
                        ((@new_board[initX+1][initY] != 0) || (@new_board[initX+2][initY] != 0))))
   	
    end

    if (@is_vertical)
      @new_board[initX][initY]   = @new_board[initX][initY+1] = @new_board[initX][initY+2] = SUBMARINE
        
    else
      @new_board[initX][initY]   = @new_board[initX+1][initY] = @new_board[initX+2][initY] = SUBMARINE
    end


    # Arranging Tug pieces.
    loop do
      @is_vertical = (@random_number.rand(50) % 2 == 0) ? false : true
      initX = @random_number.rand(50) % (@is_vertical ? 10 : 9)
      initY = @random_number.rand(50) % (@is_vertical ? 9 : 10)
      break if !((@new_board[initX][initY] != 0) ||
                (@is_vertical &&
                        ((@new_board[initX][initY+1] != 0))) ||
                (!@is_vertical && ((@new_board[initX+1][initY] != 0))))
   	
    end

    if (@is_vertical)
      @new_board[initX][initY]   = @new_board[initX][initY+1] = TUG
        
    else
      @new_board[initX][initY]   = @new_board[initX+1][initY] = TUG
    end
  end

  
  
  def display
  	for i in 0..9
      for j in 0..9
      	if (@new_board[i][j] == 0)
      	  print "."
      	else
          print @new_board[i][j]
        end
      end
      puts
    end
    puts
  end
end

# b = BattleshipsController.new
# b.display
