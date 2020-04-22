class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :roast_type
      t.string :strength
      t.references :coffee_shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
