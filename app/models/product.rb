# == Schema Information
#
# Table name: products
#
#  id                   :bigint(8)        not null, primary key
#  name                 :string
#  approval_status      :string
#  online_date          :datetime
#  offline_date         :datetime
#  unit                 :string
#  description          :string
#  base_product         :string
#  category             :integer
#  price                :decimal(, )
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  variant_type         :string
#  style                :string
#  variants             :string
#  force_in_stock       :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  vendor_id            :integer
#  style_attribute_id   :bigint(8)
#  item_category_id     :integer
#  image_data           :text
#

class Product < ApplicationRecord
  has_many :style_attributes
  has_many :item_messages
  has_many :inventories
  belongs_to :vendor

  has_many :order_entries
  has_many :orders, through: :order_entries

  has_many :chatroom_orders, through: :order_entries

  has_many :vendors_products
  has_many :vendors, through: :vendors_products

  include ProductImageUploader[:image]
  audited

  validates :name, presence: true

  has_attached_file :picture, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  def picture_url
    @url = "#{ActionController::Base.helpers.asset_path('default-product.png')}"
    if self.image_data?
      @url = self.image_url(:original)
    elsif self.picture.exists?
      @url = self.picture.url
    end
    @url
  end

  def category_name
    if self.category.present?
      Category.find(self.category).name
    end
  end
end
