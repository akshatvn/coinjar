class CurrencySnapshot < ActiveRecord::Base
  belongs_to :currency, foreign_key: :currency_code, primary_key: :code

  after_commit :update_currency_last_prices

  private


  def update_currency_last_prices
    currency.update_attributes(
      last_last: last,
      last_ask: ask,
      last_bid: bid
    )
  end

end