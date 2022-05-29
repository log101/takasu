class TradeItem < ApplicationRecord
  validates :manga_id, uniqueness: true

  belongs_to :manga
  belongs_to :trade
end
