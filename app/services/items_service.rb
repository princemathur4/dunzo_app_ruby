module ItemService
    def update_items_available_quantity(orderitems)
        for orderitem in orderitems
            menu_item_obj = MenuItem.find_by!(id=orderitem.menu_item_id)
            menu_item_obj.update(menu_item_obj.quantity: menu_item_obj.quantity - orderitem.quantity)
        end
    end
end