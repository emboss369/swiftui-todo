//
//  TodoList.swift
//  Todo
//
//  Created by user.name on 2020/05/17.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI
import CoreData

struct TodoList: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time,
                                           ascending: true)],
        animation: .default)
    var todoList: FetchedResults<TodoEntity>

    
    let category: TodoEntity.Category
    
    var body: some View {
        VStack {
            List {
                ForEach(todoList) { todo in
                    if todo.category == self.category.rawValue {
                        TodoDetailRow(todo: todo, hideIcon: true)
                    }
                }
            }
            QuickNewTask(category: category)
                .padding()
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static let container = (UIApplication.shared.delegate as! AppDelegate)
    .persistentContainer
    static let context = container.viewContext
    
    static var previews: some View {
        // テストデータの全削除
        let request = NSBatchDeleteRequest(
            fetchRequest: NSFetchRequest(entityName: "TodoEntity"))
        try! container.persistentStoreCoordinator.execute(request,
                                                          with: context)
        
        // データを追加
        TodoEntity.create(in: context,
                          category: .ImpUrg_1st, task: "炎上プロジェクト")
        TodoEntity.create(in: context,
                          category: .ImpNUrg_2nd, task: "自己啓発")
        TodoEntity.create(in: context,
                          category: .NImpUrg_3rd, task: "意味のない会議")
        TodoEntity.create(in: context,
                          category: .NImpNUrg_4th, task: "暇つぶし")

        return TodoList(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, context)
    }
}
