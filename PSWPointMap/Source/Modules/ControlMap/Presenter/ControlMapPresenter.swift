//
//  ControlMapPresenter.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 24.03.2023.
//

import Foundation
import CoreLocation

protocol ControlMapPresenterProtocol: AnyObject {
    func didTapOnMap(_ coordinate: CLLocationCoordinate2D)
    func didTapMoveToCenter()
    func didTapChangeMode()
}

final class ControlMapPresenter {
    
    private unowned let view: ControlMapViewProtocol
    
    private var model: MapSettings
    
    init(view: ControlMapViewProtocol, mapSettings: MapSettings = .standart ) {
        self.view = view
        self.model = mapSettings
    }
    
    private func setLogo(_ coordinate: CLLocationCoordinate2D) {
        model.pswCoordinate = coordinate
        view.removeLogo()
        view.setLogo(to: coordinate)
        
        if let lastLineEndCoordinate = model.lastLineEndCoordinate {
            prepareToSetLine()
            view.setLineWithCheckmark(from: coordinate, to: lastLineEndCoordinate)
        }
    }
    
    private func focusing(_ coordinate: CLLocationCoordinate2D) {
        guard let pswCoordinate = model.pswCoordinate else { return }
        model.lastLineEndCoordinate = coordinate
        prepareToSetLine()
        view.setLineWithCheckmark(from: pswCoordinate, to: coordinate)
    }
    
    private func prepareToSetLine() {
        view.removeLine()
        view.removeCheckmark()
    }
}

extension ControlMapPresenter: ControlMapPresenterProtocol {
    
    func didTapOnMap(_ coordinate: CLLocationCoordinate2D) {
        switch model.usageMode {
        case .setLogo: setLogo(coordinate)
        case .focusing: focusing(coordinate)
        }
    }
    
    func didTapMoveToCenter() {
        guard let pswCoordinate = model.pswCoordinate else { return }
        view.moveTo(pswCoordinate)
    }
    
    func didTapChangeMode() {
        model.usageMode.toggle()
    }
}
