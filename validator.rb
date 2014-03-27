
# Pseudocode
#
# INPUT: account number (9-digit integer)
# OUTPUT: true if account is valid, false otherwise
# Example:
# account number:  3  4  5  8  8  2  8  6  5
# position names:  d9 d8 d7 d6 d5 d4 d3 d2 d1
#
# checksum calculation:
# (d1+2*d2+3*d3 +..+9*d9) mod 11 = 0
#
# 1. split account number into array of single digits
# 2. map array with index, each digit *
# 3. multiply reduce array
# 4. return true if reduced array mod 11 == 0
#     false otherwise

class Validator
  def self.validate_account_number(acc_num)
    acc_array = self.split_account_number(acc_num)
    acc_array.reverse!
    acc_array.map!.with_index {|d, i| d * (i+1)}
    acc_array.reduce(:+) % 11 == 0
  end

  private

  def self.split_account_number(acc_num)
    acc_num.to_s.split("").map {|d| d.to_i}
  end


end