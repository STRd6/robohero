class CardImporter
  DATA_DIR = "data/"

  def self.import_weapons
    weapon_data = FasterCSV.table(DATA_DIR + "weapons.csv")

    weapon_data.each do |weapon_datum|
      weapon_hash = weapon_datum.to_hash

      card_name = weapon_hash[:card_name]
      unless card_name.blank?
        card = Card.find_or_create_by_name(card_name)

        rules_text = "[Attack (#{weapon_hash[:cooldown]}C): #{weapon_hash[:damage]}]"

        unless weapon_hash[:rules_text] == 0
          rules_text += weapon_hash[:rules_text]
        end

        card.update_attributes!(
          :dollar_cost => weapon_hash[:deploy_cost],
          :ready_time => weapon_hash[:ready],
          :rules_text => rules_text
        )
      end
    end
  end
  
  def self.import_utilities
    utility_data = FasterCSV.table(DATA_DIR + "utilities.csv")

    utility_data.each do |datum|
      hash = datum.to_hash

      card_name = hash[:card_name]
      unless card_name.blank?
        card = Card.find_or_create_by_name(card_name)

        rules_text = ""
        unless hash[:rules_text] == 0
          rules_text += hash[:rules_text]
        end

        flavor_text = ""
        unless hash[:flavor_text] == 0
          flavor_text = hash[:flavor_text]
        end

        card.update_attributes!(
          :dollar_cost => hash[:deploy_cost],
          :ready_time => hash[:ready],
          :rules_text => rules_text,
          :flavor_text => flavor_text || ""
        )
      end
    end
  end

  def self.import_upgrades
    upgrade_data = FasterCSV.table(DATA_DIR + "upgrades.csv")

    upgrade_data.each do |datum|
      hash = datum.to_hash

      card_name = hash[:card_name]
      unless card_name.blank?
        card = Card.find_or_create_by_name(card_name)

        rules_text = ""
        unless hash[:rules_text] == 0
          rules_text += (hash[:rules_text] || "")
        end

        flavor_text = ""
        unless hash[:flavor_text] == 0
          flavor_text = hash[:flavor_text]
        end

        card.update_attributes!(
          :dollar_cost => hash[:deploy_cost],
          :rules_text => rules_text,
          :flavor_text => flavor_text || ""
        )
      end
    end
  end

  def self.import_instants
    instant_data = FasterCSV.table(DATA_DIR + "instants.csv")

    instant_data.each do |datum|
      hash = datum.to_hash

      card_name = hash[:card_name]
      unless card_name.blank?
        card = Card.find_or_create_by_name(card_name)

        rules_text = ""
        unless hash[:rules_text] == 0
          rules_text += hash[:rules_text]
        end

        flavor_text = ""
        unless hash[:flavor_text] == 0
          flavor_text = hash[:flavor_text]
        end

        card.update_attributes!(
          :energy_cost => hash[:energy_cost],
          :rules_text => rules_text,
          :flavor_text => flavor_text || ""
        )
      end
    end
  end

  def self.import_all
    import_weapons
    import_utilities
    import_upgrades
    import_instants
  end
end