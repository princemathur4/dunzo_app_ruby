class AddAssignedDeliveryPersonToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :assigned_delivery_person, foreign_key: { to_table: :users }
  end
end
