class CreateBodyMassHistories < ActiveRecord::Migration
  def change
    create_table :body_mass_histories do |t|
      t.float :height
      t.float :weight
      t.float :body_mass

      t.timestamps null: false
    end
  end
end
