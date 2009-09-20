module CardsHelper
  def icon_list(pairs)
    output = ""
    pairs.each do |pair|
      output += render :partial => 'cards/icon_cost', :locals => {
        :icon => pair.first,
        :cost => pair.last
      }
    end

    output
  end
end
