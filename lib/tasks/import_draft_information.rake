namespace :db do
  desc "Load Players, Draft Order, and teams from csv file"
    task :draft_information => :environment do
      require 'fastercsv'
      
      rows_teams = []
      rows_players = []
      rows_picks = []
      
      
      FasterCSV.foreach("/Users/jamestrowbridge/Downloads/draft/teams.csv") do |row|   
        unless row[0] == "Team Name"
          Team.create(
            :name     => row[0],
            :division => row[1]
          )
        rows_teams << row    
        end   
      end
      
      FasterCSV.foreach("/Users/jamestrowbridge/Downloads/draft/players.csv") do |row|
        unless row[0] == "Player Name"
          Player.create(
            :name     => row[0],
            :position => row[1]
          )
        rows_players << row   
        end    
      end

      FasterCSV.foreach("/Users/jamestrowbridge/Downloads/draft/order.csv") do |row|
        puts row[2]
        unless row[0] == "Round"
          Pick.create(
            :round          => row[0],
            :pick_number    => row[1],
            :team_id => Team.find_by_name("#{row[2]}  ").id
          )
        rows_picks << row     
        end  
      end
      
      FasterCSV.open("/Users/jamestrowbridge/Downloads/draft/order.csv", "w") do |csv|
          rows_picks.each do |r|
            csv << r 
        end
      end
      
      FasterCSV.open("/Users/jamestrowbridge/Downloads/draft/players.csv", "w") do |csv|
          rows_players.each do |r|
            csv << r 
        end
      end
      
      FasterCSV.open("/Users/jamestrowbridge/Downloads/draft/teams.csv", "w") do |csv|
          rows_teams.each do |r|
            csv << r 
        end
      end
      
      File.rename("/Users/jamestrowbridge/Downloads/draft/order.csv", "/Users/jamestrowbridge/Downloads/draft/order.csv")
      File.rename("/Users/jamestrowbridge/Downloads/draft/players.csv", "/Users/jamestrowbridge/Downloads/draft/players.csv")
      File.rename("/Users/jamestrowbridge/Downloads/draft/teams.csv", "/Users/jamestrowbridge/Downloads/draft/teams.csv")
      
  end
end
