//
//  MapModuleFactory.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 24.03.2023.
//

import UIKit
import CoreLocation

struct MapModuleFactory {
    
    static private let mockStartCoordinate = CLLocationCoordinate2D(latitude: 55.785098, longitude: 37.583167)
    
    static func makeMapModule() -> UIViewController {
        let viewController = ControlMapViewController(centerCoordinate: mockStartCoordinate)
        let presenter = ControlMapPresenter(view: viewController, mapSettings: .standart)
        
        viewController.presenter = presenter
        return viewController
    }
}

