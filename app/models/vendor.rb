class Vendor < ApplicationRecord
  has_many :products

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
end
