import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(NacciTests.allTests),
        testCase(FutoshikiTest.allTests),
    ]
}
#endif
