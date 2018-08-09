local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)

require 'battleships_controller.rb'
b = BattleshipsController.new
b.display
