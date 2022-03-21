require_relative '../helpers/common/location_helper'
require_relative '../services/location_service'


class StoreController < ApplicationController
    include Common::LocationHelper
    include LocationService

    def get_nearby_stores
        user_location_result = get_user_location(user_id=params[:user_id])
        if user_location_result.nil?
            return render json: {status: true, message: ""}, status: :ok
        end
        
        user_location = [user_location_result.latitude, user_location_result.longitude]

        all_stores = Store.select(
            'stores.id, stores.name, locations.latitude, locations.longitude'
        ).joins(
            :location
        ).where({
            'locations.city' => user_location_result.city
        }).all
        all_nearby_stores_data = []
        for store_obj in all_stores
            distance = get_distance_between_locations(
                location1=user_location,
                location2=[store_obj.latitude, store_obj.longitude]
            )
            if distance <= 3 #move this to config
                all_nearby_stores_data.push({'store_id': store_obj.id, 'store_name': store_obj.name})
            end
        end
        render json: {status: true, data: all_nearby_stores}, status: :ok
    end

    def get_menu
        all_menu_items = MenuItem.select(
            'menu_items.id, items.name, items.mrp, menu_items.item_price, menu_items.available_quantity'
        ).joins(
            :item
        ).where({
            'menu_items.store_id' => params[:store_id]
        }).all
        menu_items_data = []
        for menuitem_obj in all_menu_items
            menu_items_data.push({
                'item_id': menuitem_obj.id, 
                'item_name': menuitem_obj.name, 
                'mrp': menuitem_obj.mrp,
                'item_price': menuitem_obj.item_price,
                'available_quantity': menuitem_obj.available_quantity,
            })
        end
        render json: {status: true, data: menu_items_data}, status: :ok
    end
end
