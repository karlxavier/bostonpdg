class Product < ApplicationRecord
  has_many :style_attributes
  has_many :item_messages

  has_many :order_entries
  has_many :orders, through: :order_entries

  has_many :chatroom_orders, through: :order_entries

  def convert_dynamic_fields
    if self.dynamic_fields.present? && !self.dynamic_fields.nil?
      self.dynamic_fields.gsub("=>", ":")
    else
      ''
    end

  end

  def get_html_safe_fields
    @dyna_fields = ''
    eval(self.dynamic_fields).each {|key, value| @dyna_fields = @dyna_fields + "#{key}: #{value}<br/>" }
    @dyna_fields
  end
end
