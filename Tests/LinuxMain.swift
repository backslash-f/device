import XCTest

import DeviceTests

var tests = [XCTestCaseEntry]()
tests += DeviceTests.allTests()
XCTMain(tests)
