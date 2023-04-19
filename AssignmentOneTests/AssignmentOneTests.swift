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
        
        
        func testTaskInitialization() {
            let task = Task()
            let task2 = Task(time: "10:00 AM", task: "Lecture", isChecked: true)
            
            //default state
            XCTAssertEqual(task.time, "")
            XCTAssertEqual(task.task, "")
            XCTAssertFalse(task.isChecked)
            
            //configured
            XCTAssertEqual(task2.time, "10:00 AM")
            XCTAssertEqual(task2.task, "Lecture")
            XCTAssertEqual(task2.isChecked, true)
        }
        
        func testTaskStoreInitialization(){
            let store1 = TaskStore()
            let store2 = TaskStore(tasks: Monday)
            print("\(store1)")
            print("\(store2)")
        }
        

        func testDayInitialization() {
            let testDay = Day()
            let testDay2 = Day(name: "Monday", taskStore: TaskStore(tasks: Monday))
            
            print("\(testDay)")
            print("\(testDay2)")
        }
        
        
        func testConvert(){
            //included because not in scope
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
        
        func testAppendDay(){
            
            let testDayList = DayList()
            let testDayName = "Monday"
            let testDayList2 = DayList(days: [Day(name: "Monday", taskStore: TaskStore())])
            
            func appendDay(_ name: String) {
                if !name.isEmpty {
                    let newDay = Day(name: name, taskStore: TaskStore())
                    testDayList.days.append(newDay)
                }
            }
            
            debugPrint("\(testDayList)")
            testDayList.appendDay(testDayName)
            debugPrint("\(testDayList)")

            
        }
        
        
        
        
    }
    
    
    
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

