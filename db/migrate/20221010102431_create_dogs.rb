class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :weight_imperial
      t.string :weight_metric
      t.string :height_imperial
      t.string :height_metric
      t.string :bred_for
      t.string :breed_group
      t.string :life_span
      t.string :temperament
      t.string :reference_image_id
      t.timestamps
    end
  end
end
