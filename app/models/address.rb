class Address < ApplicationRecord
  #has_many :users

  def state_and_city
    self.state + " - " + self.city
  end
end
