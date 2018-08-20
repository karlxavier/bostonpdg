class Audit < Audited::Audit
	# Extended audit trail table

	scope :unread_count, -> (last_notified){ where('created_at > ?', last_notified).count }
end