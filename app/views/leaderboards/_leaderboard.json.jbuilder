json.extract! leaderboard, :id, :user_id, :cricketscore, :footballscore, :bollywoodscore, :hollywoodscore, :created_at, :updated_at
json.url leaderboard_url(leaderboard, format: :json)
