class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string  :title,              null: false
      t.string  :animal_name,        null: false
      t.integer :animal_category_id, null: false
      t.string  :breed,              null: false
      t.integer :prefecture_id,      null: false
      t.integer :sex_id,             null: false
      t.integer :age_id,             null: false
      t.integer :weight_id,          null: false
      t.text    :reason,             null: false
      t.text    :area,               null: false
      t.integer :vaccination_id,     null: false
      t.integer :castration_id,      null: false
      t.integer :charge,             null: false
      t.text    :condition,          null: false
      t.text    :status,             null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
