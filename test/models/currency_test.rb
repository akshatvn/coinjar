require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test "should not save currency without name" do
    currency = Currency.new(code: 'BTCAUD')
    assert_not currency.save
  end

  test "should not save currency without code" do
    currency = Currency.new(name: 'test name')
    assert_not currency.save
  end

  test "should not save currency with code more than 6 characters" do
    currency = Currency.new(name: 'test name', code: "#{rand(10)}"*7)
    assert_not currency.save
  end

  test "should not save currency with name more than 40 characters" do
    currency = Currency.new(name: 'test name', code: "#{rand(10)}"*(41+rand(100)) )
    assert_not currency.save
  end

  test "should not save currency with name up to 40 characters and code less than 6 characters" do
    currency = Currency.new(name: "#{rand(10)}"*rand(41), code: "#{rand(10)}"*rand(6))
    assert_not currency.save
  end


  test "should save currency with name up to 40 characters and code 6 characters" do
    currency = Currency.new(name: "#{rand(10)}"*rand(41), code: "#{rand(10)}"*6)
    assert currency.save
  end

end