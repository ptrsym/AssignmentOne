//
//  MasterView.swift
//  AssignmentOne
//
//  Created by peter on 21/3/2023.
//

import SwiftUI

struct MasterView: View {
    
    @State private var isEditMode = false
    @ObservedObject var tasksByDay: DayList
    @State private var isAddingDay = false
    @State private var newDayName = ""

    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 60, height: 45)
                        .padding()
                }
                List{
                    ForEach(tasksByDay.days){ day in
                            NavigationLink(destination: DetailView(tasks: day.taskStore)){
                                ListRowView(day: day.name, isEditMode: $isEditMode)
                            }
                        }
                    .onDelete {indexSet in
                        tasksByDay.days.remove(atOffsets: indexSet)
                    }
                    if isAddingDay {
                        TextField("Enter day", text: $newDayName, onCommit: {
                            tasksByDay.appendDay(name: newDayName)
                            isAddingDay = false
                        }).onDisappear {
                            newDayName = ""
                        }
                    }
                    }
                }.navigationTitle("Day Planner")
                    .navigationBarItems(leading:
                                            EditButton(),
                                        trailing:
                                            Button(action: {
                        isAddingDay = true
                        
                    }) {
                        Image(systemName: "plus")
                    }.disabled(isEditMode)
                    )
            
            }
        }
    }

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(tasksByDay: tasksByDay)
    }
}
