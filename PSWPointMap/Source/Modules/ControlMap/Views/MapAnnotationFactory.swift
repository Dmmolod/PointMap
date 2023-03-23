//
//  MapAnnotationFactory.swift
//  PSWPointMap
//
//  Created by Дмитрий Молодецкий on 23.03.2023.
//

import UIKit
import MapboxMaps

struct MapAnnotationFactory {
    private enum Constant {
        static let logoViewRadius: CGFloat = 15
        static let logoSize: CGFloat = 60
        static let lineWidth: CGFloat = 1.5
        static let chekmarkSize: CGFloat = 30
    }
    
    static func makeAnnotationView(with image: UIImage?) -> UIView {
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Constant.logoViewRadius
        
        return imageView
    }
    
    static func makeLogoAnnotationOptions(for coordinate: CLLocationCoordinate2D) -> ViewAnnotationOptions {
        ViewAnnotationOptions(
            geometry: Point(coordinate),
            width: Constant.logoSize,
            height: Constant.logoSize,
            allowOverlap: true,
            anchor: .center
        )
    }
    
    static func makeCheckmarkAnnotationOptions(
        from fromCoordinate: CLLocationCoordinate2D,
        to toCoordinate: CLLocationCoordinate2D
    ) -> ViewAnnotationOptions {
        let correctAnchor = getAnchorForCurrentSide(from: fromCoordinate, to: toCoordinate)
        
        return ViewAnnotationOptions(
            geometry: Point(toCoordinate),
            width: Constant.chekmarkSize,
            height: Constant.chekmarkSize,
            allowOverlap: true,
            anchor: correctAnchor
        )
    }
    
    static func makePolylineAnnotation(from fromCoordinate: CLLocationCoordinate2D, to toCoordinate: CLLocationCoordinate2D) -> PolylineAnnotation {
        var line = PolylineAnnotation(lineCoordinates: [fromCoordinate, toCoordinate])
        line.lineWidth = Constant.lineWidth
        
        return line
    }
    
    private static func getAnchorForCurrentSide(from fromCoordinate: CLLocationCoordinate2D, to toCoordinate: CLLocationCoordinate2D) -> ViewAnnotationAnchor {
        let isLeftSide = fromCoordinate.latitude < toCoordinate.latitude && fromCoordinate.longitude > toCoordinate.longitude
        let isRighSide = fromCoordinate.latitude > toCoordinate.latitude && fromCoordinate.longitude < toCoordinate.longitude
        let isTopSide = fromCoordinate.latitude < toCoordinate.latitude && fromCoordinate.longitude < toCoordinate.longitude
        let isBottomSide = fromCoordinate.latitude > toCoordinate.latitude && fromCoordinate.longitude > toCoordinate.longitude
        
        if isLeftSide { return .right }
        if isRighSide { return .left }
        if isTopSide { return .bottom }
        if isBottomSide { return .top }
        else { return .center}
    }
}
