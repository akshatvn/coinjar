class CurrenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get currencies_url
    assert_response :success
  end
  test "should get show" do
    get currency_url(code: currencies.first.code)
    assert_response :success
  end
  test "should redirect if currency code not found" do
    get currency_url(code: '123456')
    assert_redirected_to currencies_url
  end
end