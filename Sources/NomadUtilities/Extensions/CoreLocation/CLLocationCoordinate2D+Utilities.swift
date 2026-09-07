//
//  CLLocationCoordinate2D+Utilities.swift
//
//
//  Created by Justin Ackermann on 11/28/22.
//

import Foundation
import CoreLocation

/// Bounding latitudes and longitudes for a collection of coordinates.
public struct CoordinateBounds: Equatable, Sendable {
    public var minLat: Double
    public var maxLat: Double
    public var minLng: Double
    public var maxLng: Double

    public init(
        minLat: Double,
        maxLat: Double,
        minLng: Double,
        maxLng: Double
    ) {
        self.minLat = minLat
        self.maxLat = maxLat
        self.minLng = minLng
        self.maxLng = maxLng
    }

    /// Empty-array sentinels used by `Array.minMax()`.
    public static var empty: CoordinateBounds {
        CoordinateBounds(
            minLat: .greatestFiniteMagnitude,
            maxLat: -.greatestFiniteMagnitude,
            minLng: .greatestFiniteMagnitude,
            maxLng: -.greatestFiniteMagnitude
        )
    }
}

extension CLLocationCoordinate2D {
    
    /// outputs the `CLLocationCoordinate2D` as a `CLLocation` object
    public var location: CLLocation
    { CLLocation(latitude: latitude, longitude: longitude)}
    
    /// Finds the haversine `Distance` to a specified coordinate, with a given radius in meters
    public func haversine(to coord: CLLocationCoordinate2D,
                          radius: Double = 6367444.7) -> Distance {
        let haversin = { (angle: Double) -> Double in
            return (1 - cos(angle)) / 2
        }
        
        let ahaversin = { (angle: Double) -> Double in
            return 2 * asin(sqrt(angle))
        }
        
        // Converts from degrees to radians
        let dToR = { (angle: Double) -> Double in
            return (angle / 360) * 2 * .pi
        }
        
        let lat1 = dToR(self.latitude)
        let lon1 = dToR(self.longitude)
        let lat2 = dToR(coord.latitude)
        let lon2 = dToR(coord.longitude)
        
        let meters = radius * ahaversin(haversin(lat2 - lat1) + cos(lat1) * cos(lat2) * haversin(lon2 - lon1))
        return Distance(is: meters)
    }
    
}

extension Array where Element == CLLocationCoordinate2D {

    /// Returns the bounding latitudes and longitudes in a single pass.
    ///
    /// Uses a named accumulator and a plain loop. The previous `reduce` +
    /// `min`/`max` expression fails type checking on recent Xcode toolchains
    /// with "failed to produce diagnostic for expression".
    public func minMax() -> ((minLat: Double, maxLat: Double), (minLng: Double, maxLng: Double)) {
        var bounds = CoordinateBounds.empty

        for coordinate in self {
            let lat: CLLocationDegrees = coordinate.latitude
            let lng: CLLocationDegrees = coordinate.longitude

            if lat < bounds.minLat { bounds.minLat = lat }
            if lat > bounds.maxLat { bounds.maxLat = lat }
            if lng < bounds.minLng { bounds.minLng = lng }
            if lng > bounds.maxLng { bounds.maxLng = lng }
        }

        let latitudes = (minLat: bounds.minLat, maxLat: bounds.maxLat)
        let longitudes = (minLng: bounds.minLng, maxLng: bounds.maxLng)
        return (latitudes, longitudes)
    }
}
