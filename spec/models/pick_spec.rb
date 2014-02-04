require 'spec_helper'

describe Pick do
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
  end

  describe " a new pick that is created" do

    it "should have a team number associated to the pick" do
      @pick.team_id == 1
    end

    it "should have be able to find a team object that owns the pick" do
      @pick.team == @team
    end

    it "should not have a player assigned to it yet" do
      @pick.player == nil
    end

  end

  describe "when the draft is currently going on" do

    it "should be able to keep track of the team who has the current pick" do
      Pick.current.pick_number == @pick.pick_number
    end

    it "should be able to keep track of the team who has the next pick" do
      Pick.create(
          :round        => 1,
          :pick_number  => 3,
          :team_id      => 1
          )
      Pick.current.pick_number < Pick.next.pick_number
    end

    it "should be able to keep track of the previous picks" do
      pick_two = Pick.create(
         :round        => 1,
         :pick_number  => 1,
         :team_id      => 1,
         :used         => true
         )
       Pick.current.pick_number > Pick.previous.pick_number
    end

    it "should be able to find the last three picks" do
     pick_one = Pick.create(
         :round        => 1,
         :pick_number  => 1,
         :team_id      => 1,
         :used         => true
         )
     pick_two = @pick
     pick_two.used = true
     pick_two.save
     pick_three = Pick.create(
          :round        => 1,
          :pick_number  => 3,
          :team_id      => 1,
          :used         => true
          )
     pick_four  = Pick.create(
         :round        => 1,
         :pick_number  => 4,
         :team_id      => 1,
         :used         => false
        )
      Pick.current == pick_four
      Pick.previous_picks.size <= 3
      Pick.previous_picks.include?(pick_one)
      Pick.previous_picks.include?(pick_two)
      Pick.previous_picks.include?(pick_three)
    end

    it "should give the appropriate amount of picks if there are less than three" do
      pick_one = Pick.create(
          :round        => 1,
          :pick_number  => 1,
          :team_id      => 1,
          :used         => true
          )
      Pick.current == @pick
      Pick.previous_picks.include?(pick_one)
    end


  end

end
