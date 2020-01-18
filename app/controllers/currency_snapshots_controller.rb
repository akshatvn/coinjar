class CurrencySnapshotsController < ApplicationController


  # takes a snapshot of all available currencies
  # and puts them in the database.
  def capture_all

  end

  # takes a snapshot of particular currency
  def capture
    if @currency = Currency.find_by_code(params[:code])
      CurrencySnapshot.get(currency_code: @currency.code)
      redirect_to currency_path(code: @currency.code)
    else
      flash[:error] = "Could not find currency"
    end
  end

end