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

        XCTAssertEqual(bounds.minLat, -5)
        XCTAssertEqual(bounds.maxLat, 15)
        XCTAssertEqual(bounds.minLng, -10)
        XCTAssertEqual(bounds.maxLng, 40)
    }

    func testMinMaxEmptyArrayUsesSentinelValues() {
        let bounds = [CLLocationCoordinate2D]().minMax()

        XCTAssertEqual(bounds, .empty)
        XCTAssertEqual(bounds.minLat, Double.greatestFiniteMagnitude)
        XCTAssertEqual(bounds.maxLat, -Double.greatestFiniteMagnitude)
        XCTAssertEqual(bounds.minLng, Double.greatestFiniteMagnitude)
        XCTAssertEqual(bounds.maxLng, -Double.greatestFiniteMagnitude)
    }

    func testMinMaxSingleCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        let bounds = [coordinate].minMax()

        XCTAssertEqual(bounds.minLat, 37.7749)
        XCTAssertEqual(bounds.maxLat, 37.7749)
        XCTAssertEqual(bounds.minLng, -122.4194)
        XCTAssertEqual(bounds.maxLng, -122.4194)
    }

    func testHaversineDistanceIsZeroForSamePoint() {
        let coordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
        let distance = coordinate.haversine(to: coordinate)

        XCTAssertEqual(distance.meters, 0, accuracy: 0.001)
    }
}
