require_relative '../services/cart_service'

class CartController < ApplicationController
    include CartService

    def add_menu_item_to_cart
        user_id = params[:user_id]
        quantity = params[:quantity].to_i
        discount_percentage = params[:discount_percentage].to_f
        menu_item_id = params[:menu_item_id].to_i
        
        store_id = MenuItem.find_by!(
            'menu_items.id' => menu_item_id
        ).store_id
        cart_id = find_or_create_cart(user_id=user_id, store_id=store_id)

        begin
            add_item_to_cart(cart_id=cart_id, menu_item_id=menu_item_id, quantity=quantity, discount_percentage=discount_percentage)
            render json: {status: true, message: "Added item to cart successfully!"}, status: :ok
        rescue ActiveRecord::RecordInvalid => err
            # TODO: log here
            render json: {status: false, message: "Something went wrong while adding this product to your cart"}, status: :internal_server_error
        end
    end

    def remove_menu_item_from_cart
        user_id = params[:user_id]
        menu_item_id = params[:menu_item_id].to_i
        quantity = params[:quantity].nil? ? nil : params[:quantity].to_i
        cart_id = nil
        begin
            cart_obj = find_cart(user_id=user_id)
            cart_id = cart_obj.id
        rescue ActiveRecord::RecordNotFound
            return render json: {status: true, message: "No products present in the cart already"}, status: :ok
        end

        begin
            remove_item_from_cart(cart_id=cart_id, menu_item_id=menu_item_id, quantity=quantity)
            render json: {status: true, message: "Removed item from cart successfully!"}, status: :ok
        rescue ActiveRecord::RecordInvalid => err
            # TODO: log here
            render json: {status: false, message: "Something went wrong while removing this product from your cart"}, status: :internal_server_error
        rescue Exception => err
            render json: {status: false, message: err.to_s}, status: :internal_server_error
        end
    end
end
