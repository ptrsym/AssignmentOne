//
//  AddTaskView.swift
//  AssignmentOne
//
//  Created by Peter on 3/4/2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var time = ""
    @State private var taskName = ""
    @ObservedObject var tasks: TaskStore
    
    
    var body: some View {
        VStack {
            TextField("Enter time: e.g. 7:30 am/pm", text: $time)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Enter task: e.g. Go shopping", text: $taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack{
                Button("Save") {
                    let newTask = Task(time: time, task: taskName)
                    tasks.appendTask(newTask)
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Cancel"){
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationBarTitle("Add Task")
    }
}

//struct AddTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTaskView(tasks: tasks)
//    }
//}
