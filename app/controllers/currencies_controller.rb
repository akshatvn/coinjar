class CurrenciesController < ApplicationController

  before_action :fetch_currency, except: :index

  def index
    @currencies = Currency.all
  end

  def show
    @last_snapshot = @currency.currency_snapshots.first
    @past_snapshots = @currency.currency_snapshots.where.not(id: @last_snapshot.id).paginate(page: params[:page])
  end

  private

  def fetch_currency
    unless @currency = Currency.find_by_code(params[:code])
      flash[:error] = 'Could not find currency with code ' + params[:code]
      redirect_back fallback_location: currencies_path
    end
  end

end