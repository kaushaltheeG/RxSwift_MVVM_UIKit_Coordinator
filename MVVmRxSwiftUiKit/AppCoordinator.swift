//
//  AppCoordinator.swift
//  MVVmRxSwiftUiKit
//
//  Created by Kaushal Kumbagowdana on 6/4/23.
//

import Foundation
import UIKit

/*
    coordinator pattern in iOS apps lets us remove the job of app navigation from our view controllers, helping make them more manageable and more reusable, while also letting us adjust our app's flow whenever we need
        - make your code easier to test and reason about, and also allows you to re-use view controllers elsewhere in your app more easily
*/

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        //create view controller
        let viewController = ViewController.instantiate(viewModel: RestaurantListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
