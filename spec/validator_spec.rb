require 'spec_helper'
require_relative '../validator'

describe Validator do
  it "returns true if account number is valid" do
    validator = Validator.new
    acc_num = 345882865
    expect(validator.validate_account_number(acc_num)).to be true
  end
end