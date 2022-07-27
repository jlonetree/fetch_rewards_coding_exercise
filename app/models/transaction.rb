class Transaction < ApplicationRecord
    has_one :payer
    has_one :user
end
