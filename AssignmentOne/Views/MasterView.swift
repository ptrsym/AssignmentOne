//
//  MasterView.swift
//  AssignmentOne
//
//  Created by peter on 21/3/2023.
//

import SwiftUI

struct MasterView: View {
    var body: some View {
        NavigationView{
            List(Array(tasksByDay.keys), id:\.self){day in
                NavigationLink(destination: ListView(tasks: tasksByDay[day] ?? [])){
                    Text(day)
                }
                }
        }.navigationTitle("Day Planner")
        }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
