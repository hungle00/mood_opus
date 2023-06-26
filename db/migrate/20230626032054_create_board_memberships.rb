class CreateBoardMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :board_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true
      t.boolean :owner
      t.boolean :write_access

      t.timestamps
    end
  end
end
