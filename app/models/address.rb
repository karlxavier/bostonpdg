# == Schema Information
#
# Table name: addresses
#
#  id         :bigint(8)        not null, primary key
#  street     :string
#  street_2   :string
#  city       :string
#  state      :string
#  zip        :string
#  country    :string
#  phone      :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ApplicationRecord
  #has_many :users

  def state_and_city
    self.state + " - " + self.city
  end
end
