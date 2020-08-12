import XCTest

import NacciTests

var tests = [XCTestCaseEntry]()
tests += NacciTests.allTests()
tests += FutoshikiTests.allTests()
XCTMain(tests)
