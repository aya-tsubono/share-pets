class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|

      t.timestamps
    end
  end
end
