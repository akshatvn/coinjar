require 'test_helper'

class CurrencySnapshotTest < ActiveSupport::TestCase

  setup do
    @currency_snapshot_attrs = {
      volume_24h: 1.5,
      volume: 1.5,
      transition_time: (DateTime.now - 1.second),
      status: "continuous",
      session: 12345,
      prev_close: 1.5,
      last: 1.5,
      current_time: DateTime.now,
      bid: 1.5,
      ask: 1.5,
      currency_code: 'BTCAUD'
    }
  end

  test "should not save without a currency_code" do
    currency_snapshot = CurrencySnapshot.new
    assert_not currency_snapshot.save
  end

  test "should not save without all the fields from the api present" do
    api_fields = [ :volume_24h, :volume, :transition_time, :status,
      :session, :prev_close, :last, :current_time, :bid, :ask]

    api_fields.each do |api_field_to_exclude|
      attr_hash_dup = @currency_snapshot_attrs.dup
      attr_hash_dup.delete(api_field_to_exclude)
      currency_snapshot = CurrencySnapshot.new(attr_hash_dup)
      assert_not currency_snapshot.save
    end

  end

  test "should not save without an associated currency" do
    attr_hash = @currency_snapshot_attrs
    currency_snapshot = CurrencySnapshot.new(
      @currency_snapshot_attrs.merge(currency_code: 'ABCDEF')
    )
    assert_not currency_snapshot.save
  end

  test "should save with an associated currency" do
    @currency_snapshot = currency_snapshots[0]
    attr_hash = @currency_snapshot_attrs
    currency_snapshot = CurrencySnapshot.new(@currency_snapshot_attrs)
    assert currency_snapshot.save
  end

  test "Creating new snapshot should update latest prices in currency" do
    currency_snapshot = CurrencySnapshot.create(@currency_snapshot_attrs)

    currency = currency_snapshot.currency

    assert currency.reload.updated_at >= currency_snapshot.created_at &&
            currency.last_last == currency_snapshot.last &&
            currency.last_ask == currency_snapshot.ask &&
            currency.last_bid == currency_snapshot.bid
  end

  test "Calling the fetch prices API should work" do
    Currency.pluck(:code).each do |currency_code|
      currency_snapshot = CurrencySnapshot.get(currency_code: currency_code)
      assert currency_snapshot.is_a?(CurrencySnapshot)
    end
  end

end
