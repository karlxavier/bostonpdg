class Patient < ApplicationRecord
  # include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :document_shares
  has_many :document_uploads, through: :document_shares

end
