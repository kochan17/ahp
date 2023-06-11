class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
