//
//  DetailView.swift
//  AssignmentOne
//
//  Created by peter on 23/3/2023.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var tasks: TaskStore
    @Binding var associatedDay: String
    @State private var hasReset = false
    @State private var savedCheckState: [Bool] = []
    @State var editMode : EditMode = .inactive
    @State private var isAddingTask = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                //create a view for the DayName and styling
                DayNameView(dayName: $associatedDay, isEditMode: editMode.isEditing)
            }
            .padding(.top, -40)
            
            List {
                // Loop through tasks
                ForEach(tasks.tasks) { task in
                    HStack {
                        Text(task.time)
                            .frame(maxWidth: 80, alignment: .leading)
                        
                        Spacer()
                        
                        Text(task.task)
                            .frame(maxWidth: 200, alignment: .leading)
                        
                        Spacer()
                        
                        // Checkbox to indicate task completion status
                        Image(systemName: task.isChecked ? "checkmark.square" : "square")
                            .foregroundColor(task.isChecked ? .green : .gray)
                            .onTapGesture {
                                task.isChecked.toggle()
                                tasks.objectWillChange.send()
                            }
                    }
                }
                .onDelete { indexSet in
                    // Delete task at specified index
                    tasks.tasks.remove(atOffsets: indexSet)
                }
                
                // Add task button (only visible in edit mode)
                if editMode.isEditing {
                    HStack {
                        Button(action: {
                            isAddingTask = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.blue)
                        }
                        Text("Add task")
                            .foregroundColor(.blue)
                    }
                    // Present user with a sheet for task properties
                    .sheet(isPresented: $isAddingTask) {
                        // AddTaskView for adding tasks and styling
                        AddTaskView(tasks: tasks)
                            .preferredColorScheme(.dark)
                    }
                }
            }
            .environment(\.editMode, $editMode)
            
            // Navigation bar items
            .navigationBarItems(trailing: HStack {
                if editMode.isEditing {
                    if hasReset {
                        // Undo reset button loading the array with stored previous values
                        Button(action: {
                            hasReset.toggle()
                            for index in tasks.tasks.indices {
                                tasks.tasks[index].isChecked = savedCheckState[index]
                            }
                            tasks.objectWillChange.send()
                        }) {
                            Text("Undo Reset")
                                .foregroundColor(.red)
                        }
                    } else {
                        // Reset button saves previous state into an array
                        Button(action: {
                            hasReset.toggle()
                            savedCheckState = tasks.tasks.map { $0.isChecked }
                            for index in tasks.tasks.indices {
                                tasks.tasks[index].isChecked = false
                            }
                            tasks.objectWillChange.send()
                        }) {
                            Text("Reset")
                                .foregroundColor(.red)
                        }
                    }
                }
                EditButton()
                    .environment(\.editMode, $editMode)
            })
        }
    }
    
}
