Factory.define :card do |card|
  card.name "Taco Bell"
  card.dollar_cost 0
  card.energy_cost 0
  card.ready_time 0
end

Factory.define :game do |game|
  game.name "Test Game"
end

Factory.define :player do |player|
  player.association :account
  player.association :robot
  player.name "Test Player"
end

Factory.define :robot do |robot|
  robot.name "Test Robot"
  robot.armor 1
  robot.energy_max 10
  robot.health_max 40
end

Factory.define :account do |account|
  
end

Factory.define :facebook_login do |login|
  login.association :account
end

Factory.define :link do |link|
  link.association :account
  link.channel "test"
end

Factory.define :link_event do |link_event|
  link_event.association :link
end

Factory.sequence(:deck_list_name) do |n|
  "DECK_#{n}"
end

Factory.define :deck_list do |deck_list|
  deck_list.name { Factory.next(:deck_list_name) }
  deck_list.association :account
end