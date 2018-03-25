class AddDefaultValueToLeaderboard < ActiveRecord::Migration[5.1]
  def change
  	def up
  		change_column_default :leaderboard, :cricketques, 0
  		change_column_default :leaderboard, :footballques, 0
  		change_column_default :leaderboard, :bollywoodques, 0
  		change_column_default :leaderboard, :hollywoodques, 0
	end

	def down
  		change_column_default :leaderboard, :cricketques, 0
  		change_column_default :leaderboard, :footballques, 0
  		change_column_default :leaderboard, :bollywoodques, 0
  		change_column_default :leaderboard, :hollywoodques, 0
	end
  end
end
