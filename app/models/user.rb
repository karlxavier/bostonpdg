class User < ApplicationRecord
  #belongs_to :shipping_address, :class_name => 'Address', :foreign_key => 'shipping_address'
  #belongs_to :billing_address, :class_name => 'Address', :foreign_key => 'billing_address'

  has_many :brands
  has_many :groups
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
end
