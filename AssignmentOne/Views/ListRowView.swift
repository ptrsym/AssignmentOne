//
//  ListRowView.swift
//  AssignmentOne
//
//  Created by Peter on 30/3/2023.
//

import SwiftUI

struct ListRowView: View {
    
   var day: String
    
    
    var body: some View {
        HStack{
            Text(day)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(day: "Monday")
    }
}
