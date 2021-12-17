class AddColumnPetId < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :pet, null: false, foreign_key: true  end
end
