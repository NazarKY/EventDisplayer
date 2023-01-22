class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.float :points_qual
      t.float :prize_pool
      t.float :buy_in
      t.integer :entrants_count
      t.date :holding_date

      t.timestamps
    end
  end
end
