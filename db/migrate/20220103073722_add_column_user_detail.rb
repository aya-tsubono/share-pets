class AddColumnUserDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :user_details, :prefecture_id, :integer
  end
end
