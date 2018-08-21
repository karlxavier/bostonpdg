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
end
