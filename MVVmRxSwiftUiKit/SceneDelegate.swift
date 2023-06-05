//
//  SceneDelegate.swift
//  MVVmRxSwiftUiKit
//
//  Created by Kaushal Kumbagowdana on 6/2/23.
//


import UIKit

/*
 SceneDelegate: A way to manage multiple windows
    Ex: building an iPad application where you wanted more than one window open at the same time
 */

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        appCoordinator = AppCoordinator(window: window)
        
        appCoordinator?.start()
    }
}
