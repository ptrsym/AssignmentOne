//
//  ListView.swift
//  AssignmentOne
//
//  Created by peter on 23/3/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var tasks:[Task]
    
    var body: some View {
        List{
            ForEach(tasks) {task in
                HStack {
                    Text(task.time)
                    Text(task.task)
                    Spacer()
                    Image(systemName: task.isChecked ? "checkmark.square" : "square")
                }
                
            }
            
        }
        
    }
}

