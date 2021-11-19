class RenameBithdayColumnToUserDetails < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_details, :bithday, :birthday
  end
end
