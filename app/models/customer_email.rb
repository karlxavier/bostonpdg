class CustomerEmail < ApplicationRecord
    belongs_to :customer

    validates :email, presence: true
end
