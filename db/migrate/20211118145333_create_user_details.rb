class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.date    :bithday, null: false
      t.integer :household_id
      t.string  :experience
      t.string  :have_animal
      t.integer :pet_friendly_id
      t.text    :desired_animal
      t.string  :economic_status
      t.string  :deposit
      t.integer :have_surgery_id
      t.integer :get_vaccine_id
      t.string  :indoor_outdoor
      t.integer :visit_id
      t.integer :consent_id
      t.text    :remarks
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
