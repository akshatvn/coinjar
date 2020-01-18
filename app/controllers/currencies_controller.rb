class CurrenciesController < ApplicationController

  before_action :fetch_currency, except: :index

  def index
    @currencies = Currency.all
  end

  def show
    @snapshots = @currency.currency_snapshots
  end



  private

  def fetch_currency
    @currency = Currency.find_by_code(params[:code])
  end

end