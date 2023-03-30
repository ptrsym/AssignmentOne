//
//  AssignmentOneTests.swift
//  AssignmentOneTests
//
//  Created by peter on 16/3/2023.
//

import XCTest
@testable import AssignmentOne

final class AssignmentOneTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // put test functions in here to test them
        
        func convertTime(_ time: String) -> String? {
            let format = DateFormatter()
            format.dateFormat = "hh:mm a"
            guard let date = format.date(from: time) else {
                return nil
            }
            format.dateFormat = "HH:mm"
            return format.string(from: date)
        }

        let time = "1:30 PM"
        let result = convertTime(time)
        XCTAssertEqual(result, "13:30")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

