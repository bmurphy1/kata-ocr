require 'spec_helper'
require_relative '../validator'

describe Validator do
  it "returns true if account number is valid" do
    acc_num = 457508000
    expect(Validator.validate_account_number(acc_num)).to be true
  end

  it "returns false if account number is invalid" do 
    acc_num = 345882866
    expect(Validator.validate_account_number(acc_num)).to be false
  end
end