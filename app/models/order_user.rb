# == Schema Information
#
# Table name: order_users
#
#  id             :bigint(8)        not null, primary key
#  regional       :integer
#  comms          :integer
#  art            :integer
#  processor      :integer
#  order_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  client_contact :integer
#  designer       :integer
#

class OrderUser < ApplicationRecord
  belongs_to :order

  scope :chatroom_order_users, -> (order_id) { 
      regional_users(order_id)
      .or(comms_users(order_id))
      .or(art_users(order_id))
      .or(processor_users(order_id))
      .or(client_contact_users(order_id))
      .or(designer_users(order_id))
  }

  scope :regional_users, -> (order_id) { User.select(:id, :first_name, :last_name, :updated_at).where("id IN (?)", regional(order_id)) }
  scope :regional, -> (order_id) { select(:regional).where(order_id: order_id).where.not(regional: nil).pluck(:regional) }

  scope :comms_users, -> (order_id) { User.select(:id, :first_name, :last_name, :updated_at).where("id IN (?)", comms(order_id)) }
  scope :comms, -> (order_id) { select(:comms).where(order_id: order_id).where.not(comms: nil).pluck(:comms) }

  scope :art_users, -> (order_id) { User.select(:id, :first_name, :last_name, :updated_at).where("id IN (?)", art(order_id)) }
  scope :art, -> (order_id) { select(:art).where(order_id: order_id).where.not(art: nil).pluck(:art) }

  scope :processor_users, -> (order_id) { User.select(:id, :first_name, :last_name, :updated_at).where("id IN (?)", processor(order_id)) }
  scope :processor, -> (order_id) { select(:processor).where(order_id: order_id).where.not(processor: nil).pluck(:processor) }

  scope :client_contact_users, -> (order_id) { User.select(:id, :first_name, :last_name, :updated_at).where("id IN (?)", client_contact(order_id)) }
  scope :client_contact, -> (order_id) { select(:client_contact).where(order_id: order_id).where.not(client_contact: nil).pluck(:client_contact) }

  scope :designer_users, -> (order_id) { User.select(:id, :first_name, :last_name, :updated_at).where("id IN (?)", designer(order_id)) }
  scope :designer, -> (order_id) { select(:designer).where(order_id: order_id).where.not(designer: nil).pluck(:designer) }

  scope :not_in_users, -> (user_ids) { User.select(:id, :first_name, :last_name).where("id NOT IN (?)", user_ids)}

  def regional_name
    if !self.regional.nil? && self.regional != ""
      user = User.find(self.regional)
      user.first_name + " " + user.last_name
    else
      ""
    end
  end
  def comms_name
    if !self.comms.nil? && self.comms != ""
      user = User.find(self.comms)
      user.first_name + " " + user.last_name
    else
      ""
    end
  end
  def art_name
    if !self.art.nil? && self.art != ""
      user = User.find(self.art)
      user.first_name + " " + user.last_name
    else
      ""
    end
  end
  def processor_name
    if !self.processor.nil? && self.processor != ""
      user = User.find(self.processor)
      user.first_name + " " + user.last_name
    else
      ""
    end
  end
end
