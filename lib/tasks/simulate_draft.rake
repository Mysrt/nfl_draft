  desc "Simulate the draft order"
    task :simulate_draft => :environment do
      picks = Pick.find(:all)
      picks.sort_by {|pick| pick['pick_number']}
      picks.each do |pick|
        pick.team.kiper_draft
      end

  end
