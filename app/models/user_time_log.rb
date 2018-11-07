class UserTimeLog < ApplicationRecord
    belongs_to :user

    scope :get_active_time_in, -> (user_id) { UserTimeLog.where(user_id: user_id, active: true) }

    # scope :group_logs, -> (user_id) { UserTimeLog.where(user_id: user_id).group_by { |log| log.created_at.to_date}.flat_map { |day, logs| logs.reverse}.first(100) }

    # scope :group_logs, -> (user_id) { UserTimeLog.where(user_id: user_id).order("date_trunc('day', created_at) DESC, time_out DESC").limit(5).pluck("date_trunc('day', created_at)", :time_out) }

    # scope :group_logs, -> (user_id) { UserTimeLog.where(user_id: user_id).group_by {|t| t.created_at.beginning_of_day }}

    scope :group_logs, -> (user_id) { UserTimeLog.where(user_id: user_id).group("created_at::date").order("created_at::date DESC").sum(:duration)}

    scope :log_details, -> (user_id, created_at) { UserTimeLog.where("user_id = ? AND created_at::date = ?", user_id, created_at).where('duration IS NOT NULL AND time_in IS NOT NULL AND time_out IS NOT NULL ').order("created_at DESC") }

end
