//
//  MasterView.swift
//  AssignmentOne
//
//  Created by peter on 21/3/2023.
//

import SwiftUI

struct MasterView: View {
    
    @State var editMode : EditMode = .inactive
    @ObservedObject var tasksByDay: DayList
    @State private var isAddingDay = false
    @State private var newDayName = ""
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                // Show message if there are no entries
                if tasksByDay.days.isEmpty, !isAddingDay, editMode == .inactive{
                    Text("No entries, tap '+' to get started!")
                        .padding(.top, 25)
                        .bold()
                        .font(.system(size: 21))
                        .foregroundColor(.blue)
                    Spacer()
                }
                else{
                    List{
                        // Loop through all days and display them
                        ForEach(tasksByDay.days){ day in
                            let indexOfDay = tasksByDay.days.firstIndex(where: {$0.id == day.id})!
                            NavigationLink(destination: DetailView(tasks: day.taskStore, associatedDay: $tasksByDay.days[indexOfDay].name)){
                                ListRowView(day: day.name)
                            }
                        }
                        // remove the day at the index on deletion
                        .onDelete {indexSet in
                            tasksByDay.days.remove(atOffsets: indexSet)
                        }
                        // when editing enable moving of days
                        .onMove {source, destination in
                            tasksByDay.days.move(fromOffsets: source, toOffset: destination)
                        }
                        // Show a textfield to add new day
                        if isAddingDay {
                            TextField("Enter day", text: $newDayName, onCommit: {
                                tasksByDay.appendDay( newDayName)
                                isAddingDay = false
                                editMode = .active
                            }).onDisappear {
                                newDayName = ""
                            }
                        }
                    }.environment(\.editMode, $editMode)
                  
                }
            }
                // Set the navigation bar title and buttons
                .navigationTitle("Day Planner")
                .navigationBarItems(
                    // Add the edit button
                    leading: EditButton().disabled(isAddingDay),
                    // make a HStack for sort and Add buttons
                    trailing: HStack{
                        //sort button disabled when array is empty
                        Button(action:{
                            tasksByDay.sortDays()
                        }) {
                            Text("Autosort")
                        }.disabled(tasksByDay.days.isEmpty)
                        // add button
                        Button(action: {
                            isAddingDay = true
                            editMode = .inactive
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                ).environment(\.editMode, $editMode)
                
                
            }
        }
    }
    
    
    struct MasterView_Previews: PreviewProvider {
        static var previews: some View {
            MasterView(tasksByDay: DayList())
        }
    }
    


