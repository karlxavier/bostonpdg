# == Schema Information
#
# Table name: audits
#
#  id              :bigint(8)        not null, primary key
#  auditable_id    :integer
#  auditable_type  :string
#  associated_id   :integer
#  associated_type :string
#  user_id         :integer
#  user_type       :string
#  username        :string
#  action          :string
#  audited_changes :jsonb
#  version         :integer          default(0)
#  comment         :string
#  remote_address  :string
#  request_uuid    :string
#  created_at      :datetime
#

class Audit < Audited::Audit
	# Extended audit trail table

	scope :unread_count, -> (last_notified){ where('created_at > ?', last_notified).count }

	# scope :normal_user_unread_count, -> (user_id) { where(auditable_type: 'Message').where("audited_changes['channel_id'] IN (?)", user_channels(user_id)) }
	# scope :new_messages, -> { select(:audited_changes['channel_id']).where(auditable_type: 'Message') }

	# scope :unread_messages, -> { ChannelUser.user_msg_channel(new_messages.audited_changes['channel_id']) }

	scope :user_channels, -> (user_id) { ChannelUser.select(:channel_id).where(user_id: user_id).distinct.pluck(:channel_id) }

	scope :admin_unread_count, -> (front_last_notified, user_id) { where("auditable_type IN ('Message','UserTimeLog')").where('created_at >= ? AND user_id <> ?', front_last_notified, user_id).count }
	scope :admin_unread_notifications, -> (front_last_notified, user_id) { where("auditable_type IN ('Message','UserTimeLog')").where('created_at >= ? AND user_id <> ?', front_last_notified, user_id) }
	scope :admin_all_notifications, -> { where("auditable_type IN ('Message','UserTimeLog')") }

	scope :user_unread_count, -> (front_last_notified, user_id) { where("auditable_type IN ('Message')").where('created_at >= ? AND associated_id IN (?) AND user_id <> ?', front_last_notified, user_channels(user_id), user_id).count }
	scope :user_unread_notifications, -> (front_last_notified, user_id) { where("auditable_type IN ('Message')").where('created_at >= ? AND associated_id IN (?) AND user_id <> ?', front_last_notified, user_channels(user_id), user_id) }
	scope :user_all_notifications, -> (user_id) { where("auditable_type IN ('Message')").where('associated_id IN (?)', user_channels(user_id)) }

end
