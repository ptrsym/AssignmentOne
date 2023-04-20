//
//  DayNameView.swift
//  AssignmentOne
//
//  Created by Peter on 3/4/2023.
//

import SwiftUI

struct DayNameView: View {
    @Binding var dayName: String
    let isEditMode: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if isEditMode {
                        TextField(dayName, text: $dayName)
                            .modifier(DayNameModifier())
                            .border(Color.blue, width: 1)
                            .padding()
                        Image(systemName: "pencil")
                            .resizable()
                            .foregroundColor(.blue)
                            .padding(.leading, -5)
                            .offset(x: -12, y: 18)
                            .frame(width: 25, height: 25)
                    
                } else {
                    Text(dayName)
                        .modifier(DayNameModifier())
                    Spacer()
                    Image(systemName: "cloud.sun.fill")
                        .resizable()
                        .frame(width: 60, height: 45)
                        .foregroundColor(.yellow)
                        .padding()
                }
            }
        }
    }
}

struct DayNameModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .padding(.vertical, 15)
            .padding(.horizontal, 15)
    }
}

struct DayNameView_Previews: PreviewProvider {
    
    @State static var dayName = "Monday"
    
    static var previews: some View {
        DayNameView(dayName: $dayName, isEditMode: true)
    }
}
