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

# any model that is dependent upon the other, you have to have t.references and include the foreign_key to be true. 
# references column then associate it with other database table. 
#null- will not allow an instance of a coffee to be created if it does not have the coffee shop id referenced as part of its parameters. 

# rails g resource coffee (singular)
# followed steps as you did for coffee shop. 
# whenever you have dependent resource, declare independent resource FIRST - BEST PRACTICE
# ORDER MATTERS

# M:N
  # independent and join is now dependent and coffee and coffee shop
  # two things that have to have M:N relationship first- order for these do not matter
  # join- dependent
    #rails g resource
  