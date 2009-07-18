class RobotInstance < ActiveRecord::Base

  belongs_to :robot
  belongs_to :account
end
