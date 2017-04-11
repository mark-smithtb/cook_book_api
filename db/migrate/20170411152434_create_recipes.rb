class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :instructions
      t.time :prep_time
      t.time :cook_time
      t.string :serving_size

      t.integer :user_id

      t.timestamps
    end
  end
end
