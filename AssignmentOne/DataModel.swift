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
     var time: String
     var task: String
     @Published var isChecked: Bool
    
    init(time: String, task: String, isChecked: Bool = false) {
        self.time = time
        self.task = task
        self.isChecked = isChecked
    }
}

class TaskStore: ObservableObject {
    @Published var tasks: [Task]
    
    init (tasks: [Task]){
        self.tasks = tasks
    }
}



//class WeeklyTasks: ObservableObject{
//    @Published var tasksByDay: [String: [Task]]
//
//    init(tasksByDay: [String: [Task]]) {
//        self.tasksByDay = tasksByDay
//    }
//}

let daysofWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
var tasksByDay: [String: [Task]] = [
        "Monday": [
            Task(time: "7:30 AM", task: "Breakfast", isChecked: true),
            Task(time: "9:00 AM", task: "Morning study", isChecked: true),
            Task(time: "12:00 PM", task: "Attend lecture", isChecked: false),
            Task(time: "2:00 PM", task: "Lunch", isChecked: false),
            Task(time: "2:30 PM", task: "Afternoon study", isChecked: false),
            Task(time: "4:00 PM", task: "Workout", isChecked: false),
            Task(time: "7:00 PM", task: "Dinner", isChecked: false),
            Task(time: "8:30 PM", task: "Free time", isChecked: false),
        ],
        
        "Tuesday": [
            Task(time: "7:30 AM", task: "Breakfast", isChecked: false),
            Task(time: "9:00 AM", task: "Morning work", isChecked: false),
            Task(time: "12:00 PM", task: "Lunch", isChecked: false),
            Task(time: "12:45 PM", task: "Afternoon work", isChecked: false),
            Task(time: "4:00 PM", task: "Workout", isChecked: false),
            Task(time: "7:00 PM", task: "Dinner", isChecked: false),
            Task(time: "8:30 PM", task: "Free time", isChecked: false),
        ],
        
        "Wednesday": [
            Task(time: "7:30 AM", task: "Breakfast", isChecked: false),
            Task(time: "9:00 AM", task: "Morning work", isChecked: false),
            Task(time: "12:00 PM", task: "Lunch", isChecked: false),
            Task(time: "12:45 PM", task: "Afternoon work", isChecked: false),
            Task(time: "4:00 PM", task: "Workout", isChecked: false),
            Task(time: "7:00 PM", task: "Dinner", isChecked: false),
            Task(time: "8:30 PM", task: "Free time", isChecked: false),
        ],
        
        "Thursday": [
            Task(time: "7:30 AM", task: "Breakfast", isChecked: false),
            Task(time: "9:00 AM", task: "Morning work", isChecked: false),
            Task(time: "12:00 PM", task: "Lecture", isChecked: false),
            Task(time: "2:00 PM", task: "Lunch", isChecked: false),
            Task(time: "4:00 PM", task: "Lab", isChecked: false),
            Task(time: "7:00 PM", task: "Workout", isChecked: false),
            Task(time: "9:30 PM", task: "Dinner", isChecked: false),
        ]
        
    ]

let sortedDays = tasksByDay.keys.sorted {day1, day2 in
    daysofWeek.firstIndex(of: day1) ?? 0 < daysofWeek.firstIndex(of: day2) ?? 0}

//func toggleChecked(for task: Task){
//    for (day, tasks) in tasksByDay{
//        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
//            tasksByDay[day]![index].isChecked.toggle()
//        }
//    }
//}
