# == Schema Information
#
# Table name: order_histories
#
#  id             :bigint(8)        not null, primary key
#  order_id       :integer
#  order_entry_id :integer
#  description    :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :integer
#

class OrderHistory < ApplicationRecord
  extend Textacular
  belongs_to :product

  def self.search(query:, order_id:)
    return self.where(order_id: order_id) if query.blank?
    self.where(order_id: order_id).basic_search(query)
  end
end
