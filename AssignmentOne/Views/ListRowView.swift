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
    @State private var showDeleteButton = false
    
    
    var body: some View {
        HStack{
            if isEditMode {
                Button (action: {
                    showDeleteButton.toggle()
                }) {
                    Image(systemName:"multiply.circle.fill")
                }.foregroundColor(.red)
                    .padding()
            }
            Text(day)
            Spacer()
            if showDeleteButton {
                Button(action: {
                    
                }) {
                    Text("Delete")
                        .background(Color.red)
                        .foregroundColor(.white)
                        .padding()
                        .font(.headline)
                }
            }
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(day: "Monday", isEditMode: .constant(true))
    }
}
