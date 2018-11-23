class Channel < ApplicationRecord
    has_many :channel_users
    has_many :users, through: :channel_users
    has_many :messages

    accepts_nested_attributes_for :channel_users, allow_destroy: :destroy
end
