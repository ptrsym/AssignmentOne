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
                if tasksByDay.days.isEmpty, !isAddingDay, !isEditMode {
                    Text("No entries... tap + to get started!")
                        .padding(.top, 25)
                        .bold()
                        .font(.system(size: 22))
                        .foregroundColor(.blue)
                    Spacer()
                }
                else{
                    List{
                        ForEach(tasksByDay.days){ day in
                            let indexOfDay = tasksByDay.days.firstIndex(where: {$0.id == day.id})!
                            NavigationLink(destination: DetailView(tasks: day.taskStore, associatedDay: $tasksByDay.days[indexOfDay].name)){
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
                }
            }
            .navigationTitle("Day Planner")
                    .navigationBarItems(leading:
                                            EditButton(),
                                        trailing:
                                            Button(action: {
                        isAddingDay = true
                        
                    }) {
                        Image(systemName: "plus")
                    }.disabled(isEditMode)
                    )
                    .onAppear {
                        tasksByDay.sortDays()
                    }
            
            }
    }
    }

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(tasksByDay: tasksByDay)
    }
}
