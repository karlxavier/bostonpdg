# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles_mask             :integer
#  admin                  :boolean
#  billing_address        :integer
#  shipping_address       :integer
#  first_name             :string
#  last_name              :string
#  brand_id               :bigint(8)
#  group_id               :bigint(8)
#  mobile                 :string
#  notes                  :text
#  active                 :boolean
#  title                  :string
#  phone                  :string
#  customer_id            :integer
#  vendor_id              :integer
#

class User < ApplicationRecord
  #belongs_to :shipping_address, :class_name => 'Address', :foreign_key => 'shipping_address'
  #belongs_to :billing_address, :class_name => 'Address', :foreign_key => 'billing_address'

  has_many :brands
  has_many :groups

  # has_many :comms, class_name: 'OrderUser', primary_key: 'id', foreign_key: 'comms'
  # has_many :chatroom_orders, through: :comms

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %i[admin product_manager sales_manager views_only]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end

  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return "#{self.email}"
    #if false
    #return nil
  end
  def notification_email(object)
    #Check if an email should be sent for that object
    #if true
    return "#{self.email}"
    #if false
    #return nil
  end

  def full_name
    if self.first_name.present? && self.last_name.present?
      self.first_name + " " + self.last_name
    else
      'NIL'
    end
  end
end
