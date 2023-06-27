class CreateEmbeds < ActiveRecord::Migration[7.0]
  def change
    create_table :embeds do |t|
      t.references :board, null: false, foreign_key: true
      t.string :title
      t.string :embeddable_type
      t.references :embeddable, null: false

      t.timestamps
    end
  end
end
