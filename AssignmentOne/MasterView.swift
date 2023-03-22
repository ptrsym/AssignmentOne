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
            List{
                ForEach (daysofWeek, id:\.self) {day in
                NavigationLink (destination: ContentView (
                    Text(day)
                }
            }
            .navigationTitle("Days of the week")
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView()
    }
}
