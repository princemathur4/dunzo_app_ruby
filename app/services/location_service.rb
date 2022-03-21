class LocationService
    def get_user_location(user_id)
        user_location_result = Location.joins(
            :user_locations
        ).where({
            'user_locations.user_id' => params[:user_id]
        }).first
        return user_location_result
    end

    def get_available_delivery_person(store_id)
        # TODO: merge these queries
        location_result = Location.joins(
            :stores
        ).where({
            'stores.id' => store_id
        }).first

        available_delivery_person = User.joins(
            :user_availabilities
        ).joins(
            user_locations: :location
        ).where({
            'locations.city' => location_result.city, 
            'user_availabilities.status' => 'AVAILABLE'
        }).first
        if available_delivery_person.nil?
            raise OrderError("No delivery person available currently")
        end
        return available_delivery_person
    end

    def get_all_available_delivery_persons(city, state)
        # TODO: merge these queries
        all_available_delivery_persons = User.select(
            'users.id, locations.latitude, locations.longitude'
        ).joins(
            :user_availabilities
        ).joins(
            user_locations: :location
        ).where({
            'locations.state' => state, 
            'locations.city' => city, 
            'user_availabilities.status': ['AVAILABLE', 'ASSIGNED']
        }).all
        if available_delivery_person.nil?
            raise OrderError("No delivery person available currently")
        end
        return available_delivery_person
    end

    def get_best_possible_delivery_person(order_id)
        store_location_result = Location.joins(
            :stores
        ).where({
            'stores.id' => store_id
        }).first
        store_location = [store_location_result.latitude, store_location_result.longitude]
        available_users_res = get_all_available_delivery_persons(location_result.city, location_result.state)
        user_to_assign = nil
        min_dist = nil
        for available_user_obj in available_users_res
            distance = get_distance_between_locations(
                location1=store_location,
                location2=[available_user_obj.latitude, available_user_obj.longitude]
            )
            if min_dist.nil? || min_dist > distance
                user_to_assign = available_user_obj.id
                min_dist = distance
            end
        end
        return available_delivery_person
    end
end
