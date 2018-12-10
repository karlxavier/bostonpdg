class Channel < ApplicationRecord
    has_many :channel_users
    has_many :users, through: :channel_users
    has_many :messages

    accepts_nested_attributes_for :channel_users, allow_destroy: :destroy

    scope :user_channels, -> (user_id) { includes(:channel_users, :users, :messages).where(channel_users: { user_id: user_id }) }

end
