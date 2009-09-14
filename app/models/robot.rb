class Robot < ActiveRecord::Base
  SLOT_TYPES = %w[body arm misc]

  validates_numericality_of :armor
  validates_numericality_of :egen
  validates_numericality_of :health_max, :greater_than_or_equal_to => 0
  validates_numericality_of :energy_max, :greater_than_or_equal_to => 0
  validates_numericality_of :body_slots, :greater_than_or_equal_to => 0
  validates_numericality_of :arm_slots, :greater_than_or_equal_to => 0
  validates_numericality_of :misc_slots, :greater_than_or_equal_to => 0

  def self.import_default_robots
    testbot = find_or_initialize_by_name("Testbot")
    testbot.armor = 1
    testbot.egen = 2
    testbot.health_max = 40
    testbot.energy_max = 6
    testbot.body_slots = 1
    testbot.arm_slots = 2
    testbot.misc_slots = 2
    testbot.save!
  end
end
