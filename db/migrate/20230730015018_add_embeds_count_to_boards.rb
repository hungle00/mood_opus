class AddEmbedsCountToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :embeds_count, :integer
  end
end
