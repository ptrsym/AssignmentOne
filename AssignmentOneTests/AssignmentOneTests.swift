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
        testTaskInitialization()
        testTaskStoreInitialization()
        testDayInitialization()
        testDayListIntialization()
        testConvertTime()
        testAppendDay()
        testSortDays()
    }
        
    
        func testSortDays() {
            
            // Create some test data
            let sunday = Day(name: "Sunday")
            let tuesday = Day(name: "Tuesday")
            let saturday = Day(name: "Saturday")
            let testDays = DayList(days: [tuesday, sunday, saturday])
            
            // Call the function to sort the days
            testDays.sortDays()
            
            // Check if the days are sorted correctly
            XCTAssertEqual(testDays.days[0].name, "Sunday")
            XCTAssertEqual(testDays.days[1].name, "Tuesday")
            XCTAssertEqual(testDays.days[2].name, "Saturday")
        }
        
    
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
            
            XCTAssertEqual(store1.tasks.count, 0)
            
            XCTAssertEqual(store2.tasks.count, 1)
            XCTAssertEqual(store2.tasks[0].time, "7:30 AM")
            XCTAssertEqual(store2.tasks[0].task, "Breakfast")
            XCTAssertEqual(store2.tasks[0].isChecked, false)
        }
        
        
        func testDayInitialization() {
            let testDay = Day()
            let testDay2 = Day(name: "Wednesday", taskStore: TaskStore(tasks: Wednesday))
            
            XCTAssertEqual(testDay.name, "")
            XCTAssertEqual(testDay.taskStore.tasks.count, 0)
            
            XCTAssertEqual(testDay2.name, "Wednesday")
            XCTAssertEqual(testDay2.taskStore.tasks.count, 3)
            XCTAssertEqual(testDay2.taskStore.tasks[0].time, "7:30 AM")
            XCTAssertEqual(testDay2.taskStore.tasks[1].task, "Lunch")
            XCTAssertEqual(testDay2.taskStore.tasks[2].isChecked, false)
        }
        
        func testDayListIntialization(){
            
            let testDayList2 = DayList(days: [Day(name: "Wednesday", taskStore: TaskStore(tasks: Wednesday))])
            
            XCTAssertEqual(testDayList2.days[0].name, "Wednesday")
            XCTAssertEqual(testDayList2.days[0].taskStore.tasks.count, 3)
            XCTAssertEqual(testDayList2.days[0].taskStore.tasks[0].time, "7:30 AM")
            XCTAssertEqual(testDayList2.days[0].taskStore.tasks[0].task, "Breakfast")
            XCTAssertEqual(testDayList2.days[0].taskStore.tasks[0].isChecked, false)
            
        }
        
        func testConvertTime(){
            //            included because not in scope
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
            
            func appendDay(_ name: String) {
                if !name.isEmpty {
                    let newDay = Day(name: name, taskStore: TaskStore())
                    testDayList.days.append(newDay)
                }
            }
            // add 2 days to the empty test daylist
            testDayList.appendDay("Monday")
            testDayList.appendDay("Tuesday")
            // check the days are in order
            XCTAssertEqual(testDayList.days[0].name, "Monday")
            XCTAssertEqual(testDayList.days[1].name, "Tuesday")
        }
        
        
        func testPerformanceExample() throws {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }
        
    }
    
