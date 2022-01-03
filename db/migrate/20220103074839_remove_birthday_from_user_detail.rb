class RemoveBirthdayFromUserDetail < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_details, :birthday, :date
  end
end
