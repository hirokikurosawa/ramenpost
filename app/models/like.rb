class Like < ApplicationRecord
  belogns_to :user
  belogns_to :post
end
