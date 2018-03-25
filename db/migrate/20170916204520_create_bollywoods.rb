class CreateBollywoods < ActiveRecord::Migration[5.1]
  def change
    create_table :bollywoods do |t|
      t.string :question
      t.string :opta
      t.string :optb
      t.string :optc
      t.string :optd
      t.string :correctans

      t.timestamps
    end
  end
end
