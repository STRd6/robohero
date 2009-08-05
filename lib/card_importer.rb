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
        puts card
      end
    end
  end
end