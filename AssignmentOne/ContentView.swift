//
//  ContentView.swift
//  AssignmentOne
//
//  Created by peter on 16/3/2023.
//

import SwiftUI

var agenda = ["Have breakfast", "Morning work", "Have lunch", "Afternoon work", "Gym", "Have dinner", "Free time", "Sleep"]

struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading){
            List{
                ForEach(agenda, id:\.self)
                {
                    item in
                    Text(item)
                }
            }
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
