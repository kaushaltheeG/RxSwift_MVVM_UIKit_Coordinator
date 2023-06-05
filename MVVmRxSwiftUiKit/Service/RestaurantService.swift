//
//  RestaurantService.swift
//  MVVmRxSwiftUiKit
//
//  Created by Kaushal Kumbagowdana on 6/4/23.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    // all the function avaible for within this service's protocol
    func fetchLocalRestaurants() -> Observable<[Restaurant]>
    func fetchRemoteRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantServiceProtocol  {
    
    func fetchLocalRestaurants() -> Observable<[Restaurant]> {
        /*
         MVVmRxSwiftUiKit/Data/restaurants.json
         */
        
        return Observable.create { observer -> Disposable in
            // finding path to data file
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            // async work
            do {
                // connect with file hoiding data
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                // decodes and models data with Restaurant model
                let restaurant = try JSONDecoder().decode([Restaurant].self, from: data)
                // stream the data to subscriber
                observer.onNext(restaurant)
            } catch(let error) {
                observer.onError(error)
            }

            return Disposables.create {}
        }
        
    }
    
    func fetchRemoteRestaurants() -> Observable<[Restaurant]> {
        
        return Observable.create { observer -> Disposable in
            // fetching data from a url
            let task = URLSession.shared.dataTask(with: URL(string: "url-here")!) {
                data, _, _ in
                
                // error checking the recieved data
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return //Disposables.create { }
                }
                
                // async work
                do {
                    let restaurant = try JSONDecoder().decode([Restaurant].self, from: data)
                    // stream the data to subscriber
                    observer.onNext(restaurant)
                } catch(let error) {
                    observer.onError(error)
                }
            }
            
            // invokation
            task.resume()
            
            // removal from memory
            return Disposables.create {
                task.cancel()
            }
        }
        
    }
}
