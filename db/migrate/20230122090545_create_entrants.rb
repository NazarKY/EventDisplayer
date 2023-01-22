class CreateEntrants < ActiveRecord::Migration[7.0]
  def change
    create_table :entrants do |t|
      t.string :full_name
      t.float :points_qual
      t.float :prize_pool
      t.references :event, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
