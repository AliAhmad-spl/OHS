class ChangeColumnTownInHostels < ActiveRecord::Migration[5.2]
  def change
  	remove_column :hostels, :town, :string
  	add_column :hostels, :town, :integer, default: 0
  end
end
