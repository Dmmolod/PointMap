//
//  ControllMapView.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 23.03.2023.
//

import UIKit
import MapboxMaps

final class ControlMapView: UIView {
    
    private enum Constant {
        static let startZoom: CGFloat = 16
    }
    
    //MARK: - Public properties
    var didTapOnMapAction: ((CLLocationCoordinate2D) -> ())?
    var didTapMoveToCenterAction: (() -> ())?
    var didTapChangeModeAction: (() -> ())?
    
    //MARK: - Private properties
    private var mapView: MapView!
    private lazy var controllBarView = MapControlBarView()
    private lazy var lineAnnotationManager = mapView.annotations.makePolylineAnnotationManager()
   
    //MARK: - Initializers
    init(centerCoordinate: CLLocationCoordinate2D) {
        super.init(frame: .zero)
        createMap(centerCoordinate: centerCoordinate)
        setupControllBarActions()
        setupRecognizer()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    //MARK: - API
    func centerMapTo(_ coordinate: CLLocationCoordinate2D) {
        let centerCameraOption = CameraOptions(center: coordinate)
        mapView.camera.fly(to: centerCameraOption)
    }
    
    func setAnnotation(view: UIView, with options: ViewAnnotationOptions) {
        try? mapView.viewAnnotations.add(view, options: options)
    }
    
    func setLine(_ polyline: PolylineAnnotation) {
        lineAnnotationManager.annotations = [polyline]
    }
    
    func removeAnnotation(view: UIView) {
        mapView.viewAnnotations.remove(view)
    }
    
    func removeLine() {
        lineAnnotationManager.annotations = []
    }
    
    //MARK: - Private Methods
    private func setupControllBarActions() {
        controllBarView.didTapMoveToCenterAction = { [weak self] in
            self?.didTapMoveToCenterAction?()
        }
        controllBarView.didTapChangeModeAction = { [weak self] in
            self?.didTapChangeModeAction?()
        }
    }
    
    private func setupRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnMap))
        mapView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didTapOnMap(_ recognizer: UITapGestureRecognizer) {
        guard recognizer.state == .ended else { return }
        
        let point = recognizer.location(in: mapView)
        let coordinate = mapView.mapboxMap.coordinate(for: point)
        
        didTapOnMapAction?(coordinate)
    }
}

private extension ControlMapView {
    //MARK: - Private Helpers
    func createMap(centerCoordinate: CLLocationCoordinate2D) {
        let initOptions = MapInitOptions(
            cameraOptions: CameraOptions(
                center: centerCoordinate,
                zoom: Constant.startZoom
            )
        )
        mapView = MapView(frame: .zero, mapInitOptions: initOptions)
    }
}

private extension ControlMapView {
    //MARK: - Private Layout
    func setupLayout() {
        addSubview(mapView) {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.75)
        }
        
        addSubview(controllBarView) {
            $0.top.equalTo(mapView.snp.bottom)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
