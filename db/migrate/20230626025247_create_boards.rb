class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.string :slug

      t.timestamps
    end
  end
end
