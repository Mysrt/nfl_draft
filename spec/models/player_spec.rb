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
      :name         => "Colt McCoy",
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

  describe "when a player list is asked to be sorted" do

    it "should only contain players of that position" do
      players = []
      players.push(Player.create(
       :name         => "LeBron James",
       :position     => "RB"
      ))
      players.push(Player.create(
        :name         => "Mo Williams",
        :position     => "CB"
      ))
      players.push(@player)

      player = Player.filter_position("CB")

      player.first.position == "CB"
    end

    it "should be listed in alphabetical order " do
      players = []
      players.push(Player.create(
       :name         => "LeBron James",
       :position     => "QB"
      ))
      players.push(@player)
      player = Player.filter_position("QB")

      player.first.name == "Colt McCoy"
    end
  end
end
