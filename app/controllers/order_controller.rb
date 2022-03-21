require_relative '../services/order_service'
require_relative '../services/cart_service'
require_relative '../services/location_service'

class OrderController < ApplicationController
    include OrderService
    include CartService
    include LocationService

    def checkout
        user_id = params[:user_id]
        store_id = get_store_id(user_id)

        begin
            available_delivery_person = get_available_delivery_person(store_id)
        rescue OrderError
            return render json: {status: false, message: "No person available for delivery at the moment, please try again in few minutes"}, status: :internal_server_error
        end

        order_id = find_or_create_new_order(user_id, store_id)
        resitems_res = get_cart_items(user_id)
        begin
            menu_item_ids = []
            for resitem in resitems_res
                menu_item_ids.push(resitem.id)
                find_or_create_order_item(
                    order_id=order_id, 
                    menu_item_id=resitem.id,
                    available_quantity=resitem.available_quantity,
                    quantity=resitem.quantity, 
                    discount_percentage=resitem.discount_percentage,
                )
            end
        rescue OrderError => err
            return render json: {status: false, message: "#{err}"}, status: :internal_server_error
        end

        # TODO: use 'destroy_by' method here with a 'not in' operator instead of this
        orderitems_res = OrderItem.where(order_id: order_id)
        for orderitem in orderitems_res
            if !menu_item_ids.include?(orderitem.menu_item_id)
                orderitem.destroy!
            end
        end
        render json: {status: true, message: "Order created"}, status: :ok
    end
    
    def complete_payment
        user_id = params[:user_id]
        payment_amount = params[:payment_success]
        payment_success = params[:payment_success]
        order_obj = find_pending_order(user_id=user_id)
        if !payment_success
            order_obj.update(status: "PAYMENT_FAILED")
            return render json: {status: false, message: "Payment Failed. Please try again."}, status: :ok
        end
        
        user_id = get_best_possible_delivery_person(order_id)
        order_obj.update(assigned_delivery_person_id: user_id)
        orderitems_res = OrderItem.where(order_id: order_id)

        update_items_available_quantity(orderitems_res)
        render json: {status: true, message: "Order placed"}, status: :ok
    end
end
