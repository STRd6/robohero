class Robot < ActiveRecord::Base

  def is_dead?
    #haha you lose!!
    health <= 0
  end
  
end
