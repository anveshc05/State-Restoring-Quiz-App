class AddDefaultToLeaderboard < ActiveRecord::Migration[5.1]
  def change
    change_column :leaderboards, :cricketques, :integer, default: 0
    change_column :leaderboards, :footballques, :integer, default: 0
    change_column :leaderboards, :hollywoodques, :integer, default: 0
    change_column :leaderboards, :bollywoodques, :integer, default: 0	
  end
end
