# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170917133250) do

  create_table "bollywoods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "opta"
    t.string "optb"
    t.string "optc"
    t.string "optd"
    t.string "correctans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "multicheck"
  end

  create_table "crickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "opta"
    t.string "optb"
    t.string "optc"
    t.string "optd"
    t.string "correctans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "multicheck"
  end

  create_table "footballs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "opta"
    t.string "optb"
    t.string "optc"
    t.string "optd"
    t.string "correctans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "multicheck"
  end

  create_table "hollywoods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "question"
    t.string "opta"
    t.string "optb"
    t.string "optc"
    t.string "optd"
    t.string "correctans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "multicheck"
  end

  create_table "leaderboards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "cricketscore", default: 0
    t.integer "maxcricscore", default: 0
    t.integer "cricketques", default: 0
    t.integer "footballscore", default: 0
    t.integer "maxfootscore", default: 0
    t.integer "footballques", default: 0
    t.integer "bollywoodscore", default: 0
    t.integer "maxbollyscore", default: 0
    t.integer "bollywoodques", default: 0
    t.integer "hollywoodscore", default: 0
    t.integer "maxhollyscore", default: 0
    t.integer "hollywoodques", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checkc", default: false
    t.boolean "checkf", default: false
    t.boolean "checkh", default: false
    t.boolean "checkb", default: false
    t.index ["user_id"], name: "index_leaderboards_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
