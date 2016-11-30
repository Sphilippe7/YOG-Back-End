class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :month
      t.string :category
      t.string :rating

      t.timestamps null: false
    end
  end
end
