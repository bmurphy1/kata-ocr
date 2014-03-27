require 'spec_helper'
require_relative '../ocr'

describe Ocr do
  it "reads and returns a correct account number" do
    account_numbers = [000000000,111111111,222222222,333333333,444444444,555555555,666666666,777777777,888888888,999999999,123456789]
    expect(Ocr.scan_for_account_numbers("accounts.txt")).to eq account_numbers
  end

end