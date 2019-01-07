class CreateWatersources < ActiveRecord::Migration[5.1]
  def change
    create_table :watersources do |t|
      t.string :name
      t.integer :mile
      t.references :trail, foreign_key: true
    end
  end
end
