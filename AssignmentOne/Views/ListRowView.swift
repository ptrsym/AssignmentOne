//
//  ListRowView.swift
//  AssignmentOne
//
//  Created by Peter on 30/3/2023.
//

import SwiftUI

struct ListRowView: View {
    
   var day: String
    @Binding var isEditMode: Bool

    var body: some View {
        Text(day)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(day: "Monday", isEditMode: .constant(false))
    }
}
