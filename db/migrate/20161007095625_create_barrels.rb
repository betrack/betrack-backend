class CreateBarrels < ActiveRecord::Migration[5.0]
  def change
    create_table :barrels do |t|
      t.string :type
      t.integer :number
      t.integer :content
      t.text :type_details
      t.integer :rnpa
      t.text :description
      t.integer :alcohol
      t.integer :ibu
      t.string :ingredients
      t.date :elaboration_date
      t.date :expiration_date
      t.integer :lot
      t.text :comments

      t.integer :store_id
      t.integer :transport_id

      t.timestamps
    end
  end
end
