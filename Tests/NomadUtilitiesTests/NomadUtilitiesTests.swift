import XCTest
import CoreLocation
@testable import NomadUtilities

final class CLLocationCoordinate2DUtilitiesTests: XCTestCase {

    func testMinMaxFindsBoundingCoordinates() {
        let coordinates: [CLLocationCoordinate2D] = [
            CLLocationCoordinate2D(latitude: 10, longitude: 20),
            CLLocationCoordinate2D(latitude: -5, longitude: 40),
            CLLocationCoordinate2D(latitude: 15, longitude: -10),
        ]

        let bounds = coordinates.minMax()

        XCTAssertEqual(bounds.0.minLat, -5)
        XCTAssertEqual(bounds.0.maxLat, 15)
        XCTAssertEqual(bounds.1.minLng, -10)
        XCTAssertEqual(bounds.1.maxLng, 40)
    }

    func testMinMaxEmptyArrayUsesSentinelValues() {
        let bounds = [CLLocationCoordinate2D]().minMax()

        XCTAssertEqual(bounds.0.minLat, Double.greatestFiniteMagnitude)
        XCTAssertEqual(bounds.0.maxLat, -Double.greatestFiniteMagnitude)
        XCTAssertEqual(bounds.1.minLng, Double.greatestFiniteMagnitude)
        XCTAssertEqual(bounds.1.maxLng, -Double.greatestFiniteMagnitude)
    }

    func testMinMaxSingleCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let bounds = [coordinate].minMax()

        XCTAssertEqual(bounds.0.minLat, 37.7749)
        XCTAssertEqual(bounds.0.maxLat, 37.7749)
        XCTAssertEqual(bounds.1.minLng, -122.4194)
        XCTAssertEqual(bounds.1.maxLng, -122.4194)
    }

    func testHaversineDistanceIsZeroForSamePoint() {
        let coordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
        let distance = coordinate.haversine(to: coordinate)

        XCTAssertEqual(distance.meters, 0, accuracy: 0.001)
    }
}
