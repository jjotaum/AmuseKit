import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DataProviderTests.allTests),
        testCase(RouterTests.allTests)
    ]
}
#endif
