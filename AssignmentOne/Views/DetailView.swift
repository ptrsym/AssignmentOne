//
//  DetailView.swift
//  AssignmentOne
//
//  Created by peter on 23/3/2023.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var tasks: TaskStore
    
    var body: some View {
        List{
            ForEach(tasks.tasks) {task in  // may require ID when data is used
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
                            task.isChecked.toggle()
                            tasks.objectWillChange.send()
                        }
                    
                    
                }
            }
            
        }
        
    }
    
}


