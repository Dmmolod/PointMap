//
//  SceneDelegate.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 23.03.2023.
//

import UIKit
import CoreLocation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let rootViewController = MapModuleFactory.makeMapModule()
        
        window = UIWindow(windowScene: windowScene)
        window?.overrideUserInterfaceStyle = .light
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

