//
//  TaskToday.swift
//  Todo
//
//  Created by user.name on 2020/05/28.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct TaskToday: View {
    
    @FetchRequest(
       sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time,
                                          ascending: true)],
       predicate: NSPredicate(format:"time BETWEEN {%@ , %@}", Date.today as NSDate, Date.tomorrow as NSDate),
       animation: .default)
    var todoList: FetchedResults<TodoEntity>

    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("今日のタスク").font(.footnote).bold().padding()
            List(todoList) { todo in
                TodoDetailRow(todo: todo)
            }
            
        }.background(Color(UIColor.systemBackground))
        .clipShape(RoundedCorners(tl: 40, tr: 40, bl: 0, br: 0))
    }
}

struct TaskToday_Previews: PreviewProvider {
    static let context = (UIApplication.shared.delegate as! AppDelegate)
    .persistentContainer.viewContext

    static var previews: some View {
        TaskToday()
            .environment(\.managedObjectContext, context)
    }
}
