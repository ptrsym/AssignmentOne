//
//  MasterView.swift
//  AssignmentOne
//
//  Created by peter on 21/3/2023.
//

import SwiftUI

struct MasterView: View {
       
    @State private var isEditMode = false

    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 60, height: 45)
                        .padding()
                }
                List(tasksByDay.days){day in
                    NavigationLink(destination: DetailView(tasks: day.taskStore)){
                        //Text(day.name)
                        ListRowView(day: day.name)
                    }

            }
            } .navigationTitle("Day Planner")
                .navigationBarItems(leading:
                                        Button(action: {
                    
                }){
                    Text("Edit")
                },trailing:
                                        Button(action: {
                    
                }) {
                    Image(systemName: "plus")
                }
                )
            
        }
    }
}
    
struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
