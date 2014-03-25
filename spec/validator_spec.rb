require 'spec_helper'
require_relative '../validator'

describe Validator do
  it "returns true if account number is valid" do
    validator = Validator.new
    acc_num = 457508000
    expect(validator.validate_account_number(acc_num)).to be true
  end

  it "returns false if account number is invalid" do 
    validator = Validator.new
    acc_num = 345882866
    expect(validator.validate_account_number(acc_num)).to be false
  end
end