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
    @State private var isEditMode = false
    @State private var hasReset = false
    @State private var savedCheckState: [Bool] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                DayNameView(dayName: $associatedDay, isEditMode: isEditMode)
                    Spacer()
                Image (systemName: isEditMode ? "pencil.and.outline" : "cloud.sun.fill")
                        .resizable()
                        .frame(width: 60, height: 45)
                        .foregroundColor(isEditMode ? .green : .yellow)
                        .padding()
                }.padding(.top, -40)
            List{
                ForEach(tasks.tasks) {task in
                    HStack{
                        Text(task.time)
                            .frame(maxWidth: 80, alignment: .leading)
                        Spacer()
                        Text(task.task)
                            .frame(maxWidth: 200, alignment: .leading)
                        Spacer()
                        Image(systemName: task.isChecked ? "checkmark.square" : "square")
                            .foregroundColor(task.isChecked ? .green : .gray)
                            .onTapGesture{
                                task.isChecked.toggle()
                                tasks.objectWillChange.send()
                            }
                    }
                }
                
            }
        }
        .navigationBarItems(trailing: HStack {
            if hasReset {
                Button(action: {
                    hasReset.toggle()
                    for index in tasks.tasks.indices{
                        tasks.tasks[index].isChecked = savedCheckState[index]
                    }
                    tasks.objectWillChange.send()
                })
                {
                    Text("Undo")
                }.disabled(isEditMode)
            }  else {
                Button(action: {
                    hasReset.toggle()
                    savedCheckState = tasks.tasks.map {$0.isChecked}
                    for index in tasks.tasks.indices{
                        tasks.tasks[index].isChecked = false
                    }
                    tasks.objectWillChange.send()
                }) {
                    Text("Reset")
                }.disabled(isEditMode)
            }
            Button(action: {
                isEditMode.toggle()
                })
            {
                Text(isEditMode ? "Done" : "Edit")
            }
            })
        
    }
}
                                
        



