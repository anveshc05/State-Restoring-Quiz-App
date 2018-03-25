class AddColumnsForLeaderboard < ActiveRecord::Migration[5.1]
  def change
    add_column :leaderboards, :checkc, :boolean, default: false
    add_column :leaderboards, :checkf, :boolean, default: false
    add_column :leaderboards, :checkh, :boolean, default: false
    add_column :leaderboards, :checkb, :boolean, default: false
    change_column :leaderboards, :cricketques, :integer, default: 0
  end
end
