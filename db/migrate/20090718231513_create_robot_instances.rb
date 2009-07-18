class CreateRobotInstances < ActiveRecord::Migration
  def self.up
    create_table :robot_instances do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :robot_instances
  end
end
