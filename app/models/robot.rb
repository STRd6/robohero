class Robot < ActiveRecord::Base
  SLOT_TYPES = %w[body arm misc]

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
