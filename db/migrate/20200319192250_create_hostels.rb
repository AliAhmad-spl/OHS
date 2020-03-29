class CreateHostels < ActiveRecord::Migration[5.2]
  def change
    create_table :hostels do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :city
      t.string :town
      t.string :street
      t.string :near_by
      t.string :owner_name
      t.string :image
      t.text   :description 
      t.string :user_id
      t.integer :status, default: 0
      t.integer :price, default: 0
      t.integer :air_conditioned, default: 0

      t.timestamps
    end
  end
end
