require "application_system_test_case"

class CurrenciesTest < ApplicationSystemTestCase

  test "visiting the index" do
    visit currencies_url
    assert_selector "h1", text: "Currencies"
  end


  test "visiting the index" do
    visit currencies_url
    assert_selector "h1", text: "Currencies"
  end


end
