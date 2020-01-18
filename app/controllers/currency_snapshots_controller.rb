class CurrencySnapshotsController < ApplicationController


  # takes a snapshot of all available currencies
  # and puts them in the database.
  def capture_all
    Currency.all.each do |currency|
      CurrencySnapshot.get(currency_code: currency.code)
    end
    redirect_to currencies_path
  end

  # takes a snapshot of particular currency
  def capture
    if @currency = Currency.find_by_code(params[:code])
      CurrencySnapshot.get(currency_code: @currency.code)
      redirect_back(fallback_location: currencies_path)
    else
      flash[:error] = "Could not find currency"
    end
  end

end