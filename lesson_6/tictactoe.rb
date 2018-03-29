require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                                [[1, 5, 9], [3, 5, 7]]   # diagnals
WINNING_SCORE = 5
FIRST = ['choose', 'player', 'computer']

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', word = 'or')
  case arr.size
  when 0 then ' '
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----------------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd), ', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    nil
  end
end

def computer_choose_5(brd)
  5 if brd[5] == INITIAL_MARKER
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = computer_choose_5(line, brd)
    break if square
  end

  # offense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  # defense first
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def who_first?(name)
  answer = name.sample
  loop do
    if answer == 'choose'
      puts "Who should go first? Pick one (computer or player)."
      answer = gets.chomp
      break
    else
      answer
    end
  end
  answer
  binding.pry
end

computer_score = 0
player_score = 0
grand_winner = ' '

loop do # main loop
  board = initialize_board

  loop do
    display_board(board)
    case who_first?(FIRST)
    when FIRST == 'player'
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    when FIRST == 'computer'
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
  end

  display_board(board)

  loop do
    case detect_winner(board)
    when 'Player'
      player_score += 1
      prompt "#{detect_winner(board)} won this round!"
    when 'Computer'
      computer_score += 1
      prompt "#{detect_winner(board)} won this round!"
    else
      prompt "It's a tie!"
    end
    prompt "Computer #{computer_score}: Player #{player_score}. \n
     First to win 5 games wins the match, press 'y' to continue"
    user_input = gets.chomp
    break if user_input.downcase.start_with?('y')
  end

  grand_winner = detect_winner(board)

  break if computer_score == WINNING_SCORE || player_score == WINNING_SCORE
end

if grand_winner == 'Player'
  puts "You won!"
else
  puts "Computer won"
end

prompt "Thanks for playing tic tac toe, good bye!"
