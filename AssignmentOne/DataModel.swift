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
    
    init(time: String, task: String, isChecked: Bool = false) {
        self.time = time
        self.task = task
        self.isChecked = isChecked
    }
}

class TaskStore: ObservableObject, Identifiable {
    @Published var tasks: [Task]
    
    init (tasks: [Task]){
        self.tasks = tasks
        sortTasksByTime()
    }
    
    func appendTask(_ task: Task){
        tasks.append(task)
        sortTasksByTime()
    }
        
    func convertTime(_ time: String) -> String? {
        let format = DateFormatter()
        format.dateFormat = "hh:mm a"
        guard let date = format.date(from: time) else {
            return nil
        }
        format.dateFormat = "HH:mm"
        return format.string(from: date)
    }
    
    func sortTasksByTime() {
        tasks.sort(by: { task1, task2 in
            let time1 = task1.time
            let time2 = task2.time
            guard let convertedTime1 = convertTime(time1), let convertedTime2 = convertTime(time2) else {
                return false
            }
            return convertedTime1 < convertedTime2
        })
    }
}

class Day: ObservableObject, Identifiable {
    let id = UUID()
    @Published var name: String
    @Published var taskStore: TaskStore
        
    init(name: String,  taskStore: TaskStore){
        self.name = name
        self.taskStore = taskStore
        }
}
    
class DayList: ObservableObject, Identifiable {
    let id = UUID()
    @Published var days: [Day]
    
    init(days: [Day]){
        self.days = days
        sortDays()
    }
    
    let daysofWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    
    func sortDays() {
        days = days.sorted { (day1, day2) -> Bool in
            guard let index1 = daysofWeek.firstIndex(where: { $0.localizedCaseInsensitiveCompare(day1.name.lowercased()) == .orderedSame }),
                  let index2 = daysofWeek.firstIndex(where: { $0.localizedCaseInsensitiveCompare(day2.name.lowercased()) == .orderedSame })
            else {return false}
            return index1 < index2
        }
    }
    
    func appendDay(day: Day) {
        days.append(day)
        sortDays()
    }
      

}

// test data
let Monday: [Task] = [Task(time: "7:30 AM", task: "Breakfast", isChecked: true),
                      Task(time: "9:00 AM", task: "Morning study", isChecked: true),
                      Task(time: "12:00 PM", task: "Attend lecture", isChecked: false),
                      Task(time: "2:00 PM", task: "Lunch", isChecked: false),
                      Task(time: "2:30 PM", task: "Afternoon study", isChecked: false),
                      Task(time: "4:00 PM", task: "Workout", isChecked: false),
                      Task(time: "7:00 PM", task: "Dinner", isChecked: false),
                      Task(time: "8:30 PM", task: "Free time", isChecked: false),]


let Tuesday: [Task] = [Task(time: "7:30 AM", task: "Breakfast", isChecked: false),
                       Task(time: "9:00 AM", task: "Morning work", isChecked: false),
                       Task(time: "12:00 PM", task: "Lunch", isChecked: false),
                       Task(time: "12:45 PM", task: "Afternoon work", isChecked: false),
                       Task(time: "4:00 PM", task: "Workout", isChecked: false),
                       Task(time: "7:00 PM", task: "Dinner", isChecked: false),
                       Task(time: "8:30 PM", task: "Free time", isChecked: false),
]

let Wednesday: [Task] = [Task(time: "7:30 AM", task: "Breakfast", isChecked: false),
                         Task(time: "9:00 AM", task: "Morning work", isChecked: false),
                         Task(time: "12:00 PM", task: "Lunch", isChecked: false),
                         Task(time: "12:45 PM", task: "Afternoon work", isChecked: false),
                         Task(time: "4:00 PM", task: "Workout", isChecked: false),
                         Task(time: "7:00 PM", task: "Dinner", isChecked: false),
                         Task(time: "8:30 PM", task: "Free time", isChecked: false),
                     ]

let Thursday: [Task] = [Task(time: "7:30 AM", task: "Breakfast", isChecked: false),
                        Task(time: "9:00 AM", task: "Morning work", isChecked: false),
                        Task(time: "12:00 PM", task: "Lecture", isChecked: false),
                        Task(time: "2:00 PM", task: "Lunch", isChecked: false),
                        Task(time: "4:00 PM", task: "Lab", isChecked: false),
                        Task(time: "7:00 PM", task: "Workout", isChecked: false),
                        Task(time: "9:30 PM", task: "Dinner", isChecked: false),
                        
                    ]

var tasksByDay = DayList(days: [

        Day(name: "Monday", taskStore: TaskStore(tasks: Monday)),
        Day(name: "Tuesday", taskStore: TaskStore(tasks: Tuesday)),
        Day(name: "Wednesday", taskStore: TaskStore(tasks: Wednesday)),
        Day(name: "Thursday", taskStore: TaskStore(tasks: Thursday))
        ])



