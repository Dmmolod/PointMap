//
//  ViewController.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 23.03.2023.
//

import UIKit
import CoreLocation

protocol ControlMapViewProtocol: AnyObject {
    func moveTo(_ coordinate: CLLocationCoordinate2D)
    func setLogo(to coordinate: CLLocationCoordinate2D)
    func setLineWithCheckmark(from fromCoordinate: CLLocationCoordinate2D, to toCoordinate: CLLocationCoordinate2D)
    func removeLine()
    func removeLogo()
    func removeCheckmark()
}

class ControlMapViewController: UIViewController {
    
    var presenter: ControlMapPresenterProtocol?
    
    private let controlMapView: ControlMapView
    
    private let logoView = MapAnnotationFactory.makeAnnotationView(with: .pswLogo)
    private let checkmarkView = MapAnnotationFactory.makeAnnotationView(with: .greenCheckmark)
    
    init(centerCoordinate: CLLocationCoordinate2D) {
        controlMapView = ControlMapView(centerCoordinate: centerCoordinate)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = controlMapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    private func setupActions() {
        controlMapView.didTapOnMapAction = { [weak self] coordinate in
            self?.presenter?.didTapOnMap(coordinate)
        }
        
        controlMapView.didTapMoveToCenterAction = { [weak self] in
            self?.presenter?.didTapMoveToCenter()
        }
        
        controlMapView.didTapChangeModeAction = { [weak self] in
            self?.presenter?.didTapChangeMode()
        }
    }
}

extension ControlMapViewController: ControlMapViewProtocol {
    
    func moveTo(_ coordinate: CLLocationCoordinate2D) {
        controlMapView.centerMapTo(coordinate)
    }
    
    func setLogo(to coordinate: CLLocationCoordinate2D) {
        let logoOptions = MapAnnotationFactory.makeLogoAnnotationOptions(for: coordinate)
        controlMapView.setAnnotation(view: logoView, with: logoOptions)
    }
    
    func setLineWithCheckmark(from fromCoordinate: CLLocationCoordinate2D, to toCoordinate: CLLocationCoordinate2D) {
        let line = MapAnnotationFactory.makePolylineAnnotation(from: fromCoordinate, to: toCoordinate)
        let checkmarkOptions = MapAnnotationFactory.makeCheckmarkAnnotationOptions(from: fromCoordinate, to: toCoordinate)
        
        controlMapView.setLine(line)
        controlMapView.setAnnotation(view: checkmarkView, with: checkmarkOptions)
    }
    
    func removeLine() {
        controlMapView.removeLine()
    }
    
    func removeLogo() {
        controlMapView.removeAnnotation(view: logoView)
    }
    
    func removeCheckmark() {
        controlMapView.removeAnnotation(view: checkmarkView)
    }
}

