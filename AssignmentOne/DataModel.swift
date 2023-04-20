//
//  DataModel.swift
//  AssignmentOne
//
//  Created by peter on 21/3/2023.
//
// File to put all data/structs/functions for the app

import Foundation
import Combine

    
class Task: Identifiable, ObservableObject {
     let id = UUID()
     @Published var time: String
     @Published var task: String
     @Published var isChecked: Bool
    
    init(time: String = "", task: String = "", isChecked: Bool = false) {
        self.time = time
        self.task = task
        self.isChecked = isChecked
    }
}

public class TaskStore: ObservableObject, Identifiable {
    @Published var tasks: [Task]
    
    init (tasks: [Task] = []){
        self.tasks = tasks
        sortTasksByTime()
    }
    
    /// This function is called when a new task needs to be added to a TaskStore instance. It will add the task to the TaskStore and then sort it into the array in chronological order using its time property.
    /// - Parameters:
    /// task (task) - accepts a task object to add to the TaskStore
    /// - Returns:
    /// none
    /// Example:
    /// '''
    /// let newTask = Task(time: "8:00 AM", task: "Breakfast")
    /// var test = TaskStore(tasks: [Task(time: "10:00 AM", task: "Study")])
    /// test.appendTask(newTask)
    /// print(tasks) // Output: [["8:00 AM", "Breakfast", false], ["10:00 AM", "Study", false]]
    /// '''
    ///
    ///
    
    
    func appendTask(_ task: Task){
        tasks.append(task)
        //sortTasksByTime()
    }
       
    /// This function is used as part of the TaskStore class to append a new task object to the array and then sort the resulting array into
    /// chronological order.
    /// - Parameters:
    ///     time (string) - accepts a time string in AM/PM format e.g. "7:00 AM"
    /// - Returns:
    ///     time (string) - returns a time string converted to 24H format e.g. "7:00 AM" -> "07:00"
    /// Example:
    /// '''
    /// time = "7:00 AM"
    /// let newTime = convertTime(time)
    /// print(newTime) // Output: "07:00"
    /// '''
    
    // A function that converts a time string in "AM/PM" format to "24H" format
    public func convertTime(_ time: String) -> String? {
        
        // Create a DateFormatter object with the "AM/PM" format
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        
        // Use the DateFormatter object to convert the time string to a Date object
        guard let date = format.date(from: time) else {
            // If the conversion fails, return nil
            return nil
        }
        
        // Change the format of the DateFormatter object to 24H
        format.dateFormat = "HH:mm"
        
        // Use the DateFormatter object to convert the Date object back to a string in the "HH:mm" format
        return format.string(from: date)
    }
    
    /// This function is used to provide sort functionality in a TaskStore array sorting the elements into chronological order based on when they are scheduled to occur.
    /// - Parameters:
    ///     none
    /// - Returns:
    ///     none
    /// Example:
    /// '''
    ///    func appendTask(_ task: Task){
    ///    tasks.append(task)
    ///    sortTasksByTime()
    ///}
    ///'''
    ///
    
    // A function that sorts the tasks based on their chronological time
    public func sortTasksByTime() {
        
        // Sort the tasks array by comparing two tasks based on their scheduled time
        tasks.sort(by: { task1, task2 in
            // Extract the scheduled times of the two tasks
            let time1 = task1.time
            let time2 = task2.time
            
            // Convert the times to the 24-hour format using the 'convertTime' function
            guard let convertedTime1 = convertTime(time1), let convertedTime2 = convertTime(time2) else {
                // If the conversion fails for one or both of the tasks, return false
                return false
            }
            
            // Compare the converted times and return the result
            return convertedTime1 < convertedTime2
        })
    }
}

class Day: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var taskStore: TaskStore
        
    init(name: String = "",  taskStore: TaskStore = TaskStore()){
        self.name = name
        self.taskStore = taskStore
        }
}
    
public class DayList: ObservableObject, Identifiable {
    public let id = UUID()
    @Published var days: [Day]
    
    init(days: [Day] = []){
        self.days = days
    }
    
    let daysofWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    
    /// This function provides chronological ordering functionality to the Day objects contained within a DayList array. it is called when a new day object is appended to the DayList
    /// - Parameters:
    /// none
    /// - Returns:
    /// none
    ///
    /// Example:
    ///'''
    /// func appendDay(name: String) {
    ///    if !name.isEmpty {
    ///        let newDay = Day(name: name, taskStore: TaskStore())
    ///        self.days.append(newDay)
    ///    }
    ///    sortDays()
    ///}
    ///'''
        
    
    // A function that sorts the 'days' array based on the order of the days of the week
    public func sortDays() {
        
        // Sort days array using a closure that takes two 'Day' objects and returns a boolean
        days = days.sorted { (day1, day2) -> Bool in
            
            // Find the indices of the two days in the 'daysofWeek' array accounting for the case of the user input
            guard let index1 = daysofWeek.firstIndex(where: { $0.localizedCaseInsensitiveCompare(day1.name.lowercased()) == .orderedSame }),
                  let index2 = daysofWeek.firstIndex(where: { $0.localizedCaseInsensitiveCompare(day2.name.lowercased()) == .orderedSame })
            else {
                // If either day is not found, return false
                return false
            }
            // Compare the two indices and return true if 'index1' is less than 'index2'
            return index1 < index2
        }
    }
    
    ///This function is called when a new Day entry is to be added to the DayList object. Through the application the user is prompted to provide a day name and the associated tasks contained in the TaskStore array are initialised empty.
    ///- Parameters:
    ///name (string) - accepts a string determined by the user presumed to be a day of the week
    ///- Returns:
    ///none
    ///Example:
    ///'''
    ///var exampleDayList = DayList()
    ///exampleDayList.appendDay("Monday")
    ///print(exampleDayList) // Output: [Day: "Monday", TaskStore: []]
    ///'''
    
    // A function that creates a new Day object using a given name and an empty 'TaskStore' property, and appends it to the 'days' array
    func appendDay(_ name: String) {
        
        // Check if the given name is not empty
        if !name.isEmpty {
            
            // Create a new 'Day' object with the given name and an empty 'TaskStore'
            let newDay = Day(name: name, taskStore: TaskStore())
            
            // Append the new 'Day' object to the 'days' array
            self.days.append(newDay)
        }
        // Sort the 'days' array based on the order of the days of the week
        //sortDays()
    }
}


var tasksByDay = DayList(days: [])



// test data in scope
let Monday: [Task] = [Task(time: "7:30 AM", task: "Breakfast"),
]

let Wednesday: [Task] = [Task(time: "7:30 AM", task: "Breakfast"),
                         Task(time: "12:00 PM", task: "Lunch"),
                         Task(time: "7:00 PM", task: "Dinner"),
                     ]

let Thursday: [Task] = [Task(time: "7:30 AM", task: "Breakfast"),
                        Task(time: "12:00 PM", task: "Lecture"),
                        Task(),
                    ]

let daysofWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

