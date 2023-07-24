class AddPublicToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :public, :boolean, default: false
  end
end
