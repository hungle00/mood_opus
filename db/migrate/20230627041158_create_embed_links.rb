class CreateEmbedLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :embed_links do |t|
      t.string :url, null: false

      t.timestamps
    end
  end
end
