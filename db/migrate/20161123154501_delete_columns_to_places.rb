class DeleteColumnsToPlaces < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :zip_code
    remove_column :places, :country
    remove_column :places, :city
  end
end
