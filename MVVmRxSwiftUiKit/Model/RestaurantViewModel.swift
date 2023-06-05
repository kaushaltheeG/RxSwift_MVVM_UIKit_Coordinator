//
//  RestaurantViewModel.swift
//  MVVmRxSwiftUiKit
//
//  Created by Kaushal Kumbagowdana on 6/4/23.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
