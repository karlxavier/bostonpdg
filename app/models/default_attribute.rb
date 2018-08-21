# == Schema Information
#
# Table name: default_attributes
#
#  id          :bigint(8)        not null, primary key
#  field_name  :string
#  description :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  input_type  :string
#

class DefaultAttribute < ApplicationRecord
end
