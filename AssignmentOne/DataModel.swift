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
    
class DayList: ObservableObject {
    @Published var days: [Day]
    
    init(days: [Day]){
        self.days = sortDays(days)
    }
    
    let daysofWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    func sortDays (_ days: [Day]) -> [Day] {
        days.sorted{
            guard let index1 = daysofWeek.firstIndex(of: $0.name),
                  let index2 = daysofWeek.firstIndex(of: $1.name)
            else {return false}
            return index1 < index2
        }
    }
    
    func append(day: Day) {
        days.append(day)
        days = sortDays(days)
    }
    
    
    
    
    
}



// temp code
let daysofWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]


var tasksByDay: [String: TaskStore] = [
    
        "Monday": TaskStore(tasks: Monday),
        
        "Tuesday": TaskStore(tasks: Tuesday),
        
        "Wednesday": TaskStore(tasks: Wednesday),
        
        "Thursday": TaskStore(tasks: Thursday)
        
    ]

let sortedDays = tasksByDay.keys.sorted {day1, day2 in
    daysofWeek.firstIndex(of: day1) ?? 0 < daysofWeek.firstIndex(of: day2) ?? 0}



// initialisation data
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



