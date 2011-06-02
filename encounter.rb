class Encounter
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :campaign_id, Integer

  has n, :encounter_players
  has n, :players, :through => :encounter_player
  has n, :encounters, :through => :encounter_player

  def active_players
    players.select{|player| player.active?}
  end

end
