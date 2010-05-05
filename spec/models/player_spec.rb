require 'spec_helper'

describe Player do
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
      :name         => "Coly McCoy",
      :position     => "QB"
      )
  end

  describe "when he is drafted" do
    
    it "should mark him as a drafted player" do
      @team.draft(@player)
      @player.drafted == true
    end
    
    it "should update the pick with him as the player" do
      @team.draft(@player)
      @pick.player == @player
    end
  end
end
