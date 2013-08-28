class Letter < ActiveRecord::Base
  attr_accessor :controller_name

  belongs_to :billing
  belongs_to :user
  
  before_create :letter_has_billing
  
  private    
    def letter_has_billing
      self.create_billing(sender_name: self.sender_name)
    end
end
