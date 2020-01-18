class Currency < ActiveRecord::Base

  validates :name, :code, presence: true
  validates :code, length: { is: 6 }
  validates :name, length: { maximum: 40 }

  has_many :currency_snapshots, foreign_key: :currency_code, primary_key: :code
end