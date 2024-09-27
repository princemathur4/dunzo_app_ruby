module CartService
    def find_cart(user_id)
        return Cart.find_by!(user_id: user_id)
    end
    
    def find_or_create_cart(user_id, store_id)
        cart_id = nil
        begin
            cart_obj = find_cart(user_id=user_id)
            if cart_obj.store_id != store_id
                cart_obj.update(store_id: store_id)
            end
            cart_id = cart_obj.id
        rescue ActiveRecord::RecordNotFound
            cartobj = Cart.create(user_id:user_id, store_id:store_id)
            cart_id = cartobj.id
        end
        return cart_id
    end

    def get_cart_items(user_id)
        resitems_res = MenuItem.select(
            'menu_items.id, menu_items.available_quantity, cart_items.quantity, cart_items.discount_percentage'
        ).joins(
            cart_items: :cart 
        ).where({
            'carts.user_id' => user_id
        }).all
        return resitems_res
    end

    def add_item_to_cart(cart_id, menu_item_id, quantity, discount_percentage=0)
        begin
            existing_item = CartItem.find_by!(cart_id: cart_id, menu_item_id: menu_item_id)
            existing_item.update(quantity: quantity, discount_percentage:discount_percentage)
        rescue ActiveRecord::RecordNotFound => error
            new_cart_item = CartItem.create!(
                cart_id:cart_id, 
                menu_item_id:menu_item_id, 
                quantity:quantity, 
                discount_percentage:discount_percentage
            )
        end
    end

    def remove_item_from_cart(cart_id, menu_item_id, quantity)
        begin
            existing_item = CartItem.find_by!(cart_id: cart_id, menu_item_id: menu_item_id)
            if quantity == 0 || existing_item.quantity == 1
                existing_item.destroy
            elsif quantity.nil || existing_item.quantity > quantity
                existing_item.update(quantity: quantity.nil? ? (existing_item.quantity-1): quantity)
            elsif existing_item.quantity <= quantity
                raise Exception("Cannot remove items from cart")
            end
        rescue ActiveRecord::RecordNotFound => error
        end
    end
end
