class AddCityToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :city, :string
  end
end
