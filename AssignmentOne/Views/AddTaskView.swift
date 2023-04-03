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
            Image (systemName: "book")
                .resizable()
                .foregroundColor(.green)
                .frame(width: 70, height: 60)
                .offset(x: 0, y: -30)
            TextField("Enter time: e.g. 7:30 AM/PM", text: $time)
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
                }.foregroundColor(.green)
                    .frame(width: 80, height: 35)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.green)
                        }
                    )
                .padding()
                Spacer()
                Button("Cancel"){
                    presentationMode.wrappedValue.dismiss()
                }.foregroundColor(.red)
                    .frame(width: 80, height: 35)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.red)
                        }
                            )
                    .padding()
            }.padding()
        }
        .navigationBarTitle("Add Task")
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(tasks: TaskStore(tasks: []))
    }
}
