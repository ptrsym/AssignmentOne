//
//  DataModel.swift
//  AssignmentOne
//
//  Created by peter on 21/3/2023.
//
// File to put all data/structs/functions for the app

import Foundation
    
struct Task: Identifiable{
        let id = UUID()
        var time: String
        var task: String
        var isChecked: Bool = false
    }

let daysofWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    
var tasksByDay: [String: [Task]] = [
        "Monday": [
            Task(time: "7:30 AM", task: "Breakfast", isChecked: true),
            Task(time: "9:00 AM", task: "Morning study", isChecked: false),
            Task(time: "12:00 PM", task: "Attend lecture", isChecked: false),
            Task(time: "2:00 PM", task: "Lunch", isChecked: false),
            Task(time: "2:30 PM", task: "Afternoon study", isChecked: false),
            Task(time: "4:00 PM", task: "Workout", isChecked: false),
            Task(time: "7:00 PM", task: "Dinner", isChecked: false),
            Task(time: "8:30 PM", task: "Free time", isChecked: false),
        ]
        
        "Tuesday": [
            Task(time: "7:30 AM", task: "Breakfast", isChecked: true),
            Task(time: "9:00 AM", task: "Morning work", isChecked: false),
            Task(time: "12:00 PM", task: "Lunch", isChecked: false),
            Task(time: "12:45 PM", task: "Afternoon work", isChecked: false),
            Task(time: "4:00 PM", task: "Workout", isChecked: false),
            Task(time: "7:00 PM", task: "Dinner", isChecked: false),
            Task(time: "8:30 PM", task: "Free time", isChecked: false),
        ]
        
        "Wednesday": [
            Task(time: "7:30 AM", task: "Breakfast", isChecked: true),
            Task(time: "9:00 AM", task: "Morning work", isChecked: false),
            Task(time: "12:00 PM", task: "Lunch", isChecked: false),
            Task(time: "12:45 PM", task: "Afternoon work", isChecked: false),
            Task(time: "4:00 PM", task: "Workout", isChecked: false),
            Task(time: "7:00 PM", task: "Dinner", isChecked: false),
            Task(time: "8:30 PM", task: "Free time", isChecked: false),
        ]
        
    ]
    
}

