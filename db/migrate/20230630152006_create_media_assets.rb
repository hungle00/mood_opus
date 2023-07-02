class CreateMediaAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :media_assets do |t|

      t.timestamps
    end
  end
end
