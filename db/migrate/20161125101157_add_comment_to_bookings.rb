class AddCommentToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :comment, :text
  end
end
