//
//  DetailView.swift
//  AssignmentOne
//
//  Created by peter on 23/3/2023.
//

import SwiftUI

struct DetailView: View {
    
    @State var tasks: [Task]
    
    var body: some View {
        List{
            ForEach(tasks) {task in
                HStack{
                    Text(task.time)
                        .frame(maxWidth: 80, alignment: .leading)
                    Spacer()
                    Text(task.task)
                        .frame(maxWidth: 200, alignment: .leading)
                    Spacer()
                    Image(systemName: task.isChecked ? "checkmark.square" : "square")
                        .foregroundColor(task.isChecked ? .green : .gray)
                        .onTapGesture{
                            tasks.firstIndex(where: {$0.id == task.id}).map {tasks[$0].isChecked.toggle()}
                        }
                }.padding()
                
            }
            
        }
        
    }
}

