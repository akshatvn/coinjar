class CurrencySnapshot < ActiveRecord::Base

  API_PATH = "https://data.exchange.coinjar.com/products/%s/ticker"

  belongs_to :currency, foreign_key: :currency_code, primary_key: :code
  after_commit :update_currency_last_prices

  validates :currency, presence: true

  default_scope { order(created_at: :desc)}


  def self.get currency_code:
    path = API_PATH % currency_code
    response = HTTParty.get(path)
    if response.code == 200
      response_data = JSON.parse(response.body)
      CurrencySnapshot.create!(
        volume_24h: response_data['volume_24h'].to_f,
        volume: response_data['volume'].to_f,
        transition_time: response_data['transition_time'].to_datetime,
        status: response_data['status'],
        session: response_data['session'],
        prev_close: response_data['prev_close'].to_f,
        last: response_data['last'].to_f,
        current_time: response_data['current_time'].to_datetime,
        bid: response_data['bid'].to_f,
        ask: response_data['ask'].to_f,
        currency_code: currency_code
      )
    end
  end

  private


  def update_currency_last_prices
    currency.update_attributes(
      last_last: last,
      last_ask: ask,
      last_bid: bid,
      updated_at: Time.now # required because if price may not have changed since last snapshot
    )
  end

end