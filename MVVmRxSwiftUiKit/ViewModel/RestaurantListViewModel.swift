//
//  RestaurantListViewModel.swift
//  MVVmRxSwiftUiKit
//
//  Created by Kaushal Kumbagowdana on 6/4/23.
//

import Foundation
import RxSwift

final class RestaurantListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchLocalRestaurants()
            .map { restaurants in // maps restaurants array
                restaurants.map {  // map restaurant
                    RestaurantViewModel(restaurant: $0) // $0: restaurant obj
                }
            }
    }
}
