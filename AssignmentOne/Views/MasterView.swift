//
//  MasterView.swift
//  AssignmentOne
//
//  Created by peter on 21/3/2023.
//

import SwiftUI

struct MasterView: View {
    
    @State private var isEditMode = false
    @State private var selectedDay: Day? = nil
    
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
                List {
                    ForEach(tasksByDay.days) { day in
                        NavigationLink(destination: DetailView(tasks: day.taskStore)) {
                            ListRowView(day: day.name)
                        }
                        .swipeActions {
                            Button(action: {
                                tasksByDay.removeDay(withId: day.id)
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                    }
                }.navigationTitle("Day Planner")
                    .navigationBarItems(leading:
                                            Button(action: {
                        isEditMode.toggle()
                        
                    }){
                        Text(isEditMode ? "Done" : "Edit")
                    },
                                        trailing:
                                            Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                    }.disabled(isEditMode)
                    )
            }
        }
    }
}
struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
