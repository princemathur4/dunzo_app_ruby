module OrderService
    def find_pending_order(user_id)
        order_obj = Order.find_by!(user_id:user_id, status: :PAYMENT_PENDING)
        return order_obj
    end
    
    def get_store_id(user_id)
        store_id = Cart.find_by!(user_id: user_id).store_id
        return store_id
    end

    def find_or_create_new_order(user_id, store_id)
        order_id = nil

        begin
            order_obj = Order.find_by!(user_id:user_id, status: :PAYMENT_PENDING)
            if order_obj.store_id != store_id
                order_obj.update(store_id: store_id)
            end
            order_id = order_obj.id
        rescue ActiveRecord::RecordNotFound
            order_obj = Order.create!(user_id: user_id, store_id: store_id, status: 0, assigned_delivery_person_id: nil)
            order_id = order_obj.id
        end
    end
    
    def find_or_create_order_item(order_id, menu_item_id, available_quantity, quantity, discount_percentage)
        begin
            orderitem_obj = OrderItem.find_by!(order_id: order_id, menu_item: menu_item_id)
            if quantity > available_quantity
                raise OrderError("One or more items from your cart are no longer available")
            end
            if orderitem_obj.quantity != quantity
                orderitem_obj.update(quantity: quantity)
            end
            if orderitem_obj.discount_percentage != discount_percentage
                orderitem_obj.update(discount_percentage: discount_percentage)
            end
        rescue ActiveRecord::RecordNotFound
            orderitem_obj = OrderItem.create!(
                order_id: order_id,
                menu_item_id: menu_item_id,
                quantity: quantity,
                status: 0,
            )
        end
    end
end
