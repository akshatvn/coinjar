class CurrencySnapshotsControllerTest < ActionDispatch::IntegrationTest

  # all these test cases depend on external APIs
  # https://data.exchange.coinjar.com/products/%s/ticker

  test "should capture" do
    currency = Currency.first
    currency_snapshot_count = CurrencySnapshot.count
    post capture_currency_url(currencies.first.code)
    assert CurrencySnapshot.count > currency_snapshot_count
  end

  test "should capture all" do
    currency_count = Currency.count
    currency_snapshot_count = CurrencySnapshot.count
    post capture_all_currencies_url
    assert (CurrencySnapshot.count - currency_snapshot_count) == currency_count
  end

end