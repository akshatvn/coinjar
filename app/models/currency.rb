class Currency < ActiveRecord::Base
  has_many :currency_snapshots
end