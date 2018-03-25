class CreateLeaderboards < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboards do |t|
      t.belongs_to :user, index: true
        t.integer :cricketscore, default: 0
        t.integer :maxcricscore, default: 0
        t.integer :cricketques, default: 0
        t.integer :footballscore, default: 0
        t.integer :maxfootscore, default: 0
        t.integer :footballques, default: 0
        t.integer :bollywoodscore, default: 0
        t.integer :maxbollyscore, default: 0
        t.integer :bollywoodques, default: 0
        t.integer :hollywoodscore, default: 0
        t.integer :maxhollyscore, default: 0
        t.integer :hollywoodques, default: 0

        t.timestamps
    end
  end
end
