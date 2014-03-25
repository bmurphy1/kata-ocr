
# Pseudocode


class Ocr
  def scan_for_account_numbers(file)
    grid = build_grid(File.open(file, "r"))

  end

  private

  def build_grid(file)
    grid = []
    file.each do |line|
      line_array = []
      line.chomp
      until line.empty?
        line_array << line.slice!(0,3)
      end
      grid << line_array
    end
    grid
  end

  
end