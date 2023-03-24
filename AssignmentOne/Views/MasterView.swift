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
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 60, height: 45)
                        .padding()
                }
                List(sortedDays, id:\.self){day in
                    NavigationLink(destination: DetailView(tasks: tasksByDay[day]!)){
                        Text(day)
                    }
            }
            } .navigationTitle("Daily Planner")
            
        }
    }
}
    

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
