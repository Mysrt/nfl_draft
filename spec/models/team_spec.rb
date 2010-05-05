require 'spec_helper'

describe Team do
  before(:each) do
    @pick = Pick.create(
      :round        => 1,
      :pick_number  => 2,
      :team_id      => 1
      )
    
    @team = Team.create(
      :name         => "Washington Redskins",
      :division     => "NFC East",
      :pick_id      => 1
      )
      
     @player = Player.create(
      :name         => "Colt McCoy",
      :position     => "QB"
      )
  end

  describe " when we draft a player" do
    it "should be owned by us, unless he holds out on his contract" do
      @team.draft(@player)
      @team.players.include?(@player) == true
    end
    
    it "should use kiper best available if no player is given" do
      player = Player.kipers_best_available
      @team.kiper_draft
      @team.players.include?(player)
    end
    
  end
end
