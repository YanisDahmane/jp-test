class CreateMarkets < ActiveRecord::Migration[7.2]
  def change
    create_table :markets do |t|
      t.string :name

      t.timestamps
    end
  end
end
