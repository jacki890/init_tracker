class Encounter
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :campaign_id, Integer

  has n, :encounter_players
  has n, :players, :through => :encounter_player

  def active_players
    players.select{|p| p.active == 1}
  end

end
