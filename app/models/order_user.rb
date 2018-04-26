class OrderUser < ApplicationRecord
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
