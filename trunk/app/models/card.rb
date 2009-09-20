class Card < ActiveRecord::Base
  validates_numericality_of :ready_time, :greater_than_or_equal_to => 0
  validates_numericality_of :dollar_cost, :greater_than_or_equal_to => 0
  validates_numericality_of :energy_cost, :greater_than_or_equal_to => 0

  validates_presence_of :name

  def money_cost
    dollar_cost
  end

  def parsed_rules_text
    @parsed_rules_text ||= RoboHeroParser.new.parse(rules_text)
  end

  def attacks
    if parsed_rules_text
      parsed_rules_text.attacks
    else
      []
    end
  end

  def activated_abilities
    if parsed_rules_text
      parsed_rules_text.activated_abilities
    else
      []
    end
  end
end
