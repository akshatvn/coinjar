class Currency < ActiveRecord::Base
  has_many :currency_snapshots, foreign_key: :currency_code, primary_key: :code

end