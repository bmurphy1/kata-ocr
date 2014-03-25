require 'debugger'

# Pseudocode

# Open file
# create array for each line
# make each array element a 3 character sliced string
# result: 2d array of entire file

# create line_group of first 4 array rows from grid
# run line_group through account number matcher

# for each element in first row of line_group,
#  add the remaining elements in the same column,
#  then match against known number signatures
#  return account number



class Ocr
  def scan_for_account_numbers(file)
    # grid is 2d array with individual elements made
    #  of 3 consecutive characters from each line

    account_numbers = []
    grid = build_grid(File.open(file, "r"))
    until grid.empty?
      line_group = grid.slice!(0,4)
      account_numbers << match_account_number(line_group)
    end
    account_numbers
  end

  private

  def build_grid(file)
    grid = []
    file.each do |line|
      line_array = []
      line.chomp!
      until line.empty?
        line_array << line.slice!(0,3)
      end
      grid << line_array
    end
    grid
  end

  def match_account_number(line_group)
    number_signatures = {
    "     |  |" => "1",
    " _  _||_ " => "2",
    " _  _| _|" => "3",
    "   |_|  |" => "4",
    " _ |_  _|" => "5",
    " _ |_ |_|" => "6",
    " _   |  |" => "7",
    " _ |_||_|" => "8",
    " _ |_| _|" => "9",
    " _ | ||_|" => "0" }

    account_number = ""
    line_group.first.each_with_index do |char_element, col|
      char_group = char_element + line_group[1][col] + line_group[2][col]
      account_number << number_signatures[char_group]
    end
    account_number.to_i
  end

end

ocr = Ocr.new
ocr.scan_for_account_numbers("accounts.txt")