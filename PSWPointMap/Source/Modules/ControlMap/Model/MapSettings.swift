//
//  MapSettings.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 24.03.2023.
//

import CoreLocation

struct MapSettings {
    var usageMode: MapUsageMode
    var pswCoordinate: CLLocationCoordinate2D?
    var lastLineEndCoordinate: CLLocationCoordinate2D?
    
    static let standart: MapSettings = MapSettings(usageMode: .setLogo)
}
