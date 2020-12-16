import XCTest
@testable import Device

final class DeviceTests: XCTestCase {

    func testIsLoggingEnabledByDefault() {
        XCTAssertTrue(Device().isLoggingEnabled)
    }

    func testRetrieveOSDeviceType() {
        switch Device.type() {
        case .mac(isCatalyst: false), .unknow:
            XCTAssert(true)
        default:
            XCTFail("Expected OS to be \"Mac\" (not Catalyst) or \"Unknown\"")
        }
    }

    static var allTests = [
        ("testRetrieveOSDeviceType", testRetrieveOSDeviceType),
        ("testIsLoggingEnabledByDefault", testIsLoggingEnabledByDefault)
    ]
}
