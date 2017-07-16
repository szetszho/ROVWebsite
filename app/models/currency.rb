class Currency < ApplicationRecord
  has_many(:receipts)
end
