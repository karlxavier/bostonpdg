class ChannelUser < ApplicationRecord
    belongs_to :user
    belongs_to :channel

    def self.user_msg_channel(user_id)
        user = User.find(user_id)

        if !user.admin?
            ChannelUser.joins(:channel).select("channels.id").where(user_id: user_id).distinct
        else
            ChannelUser.joins(:channel).select("channels.id").distinct
        end
	end
end
