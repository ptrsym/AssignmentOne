//
//  ContentView.swift
//  AssignmentOne
//
//  Created by peter on 23/3/2023.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView{
            MasterView()
            Image(systemName: "cloud.sun.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
