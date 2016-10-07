class CreateDestroys < ActiveRecord::Migration[5.0]
  def change
    create_table :destroys do |t|
      t.string :Barrel

      t.timestamps
    end
  end
end
