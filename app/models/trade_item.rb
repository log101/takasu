class TradeItem < ApplicationRecord
  validates :manga_id, uniqueness: true

  belongs_to :manga, dependent: :destroy
  belongs_to :trade, dependent: :destroy
end
