//
//  AddBudgetModel.swift
//  CoreDataMVVMSwiftUI
//
//  Created by Leandro Alves da Silva on 22/06/22.
//

import Foundation
import CoreData

class AddBudgetViewModel: ObservableObject {
    @Published var title = ""
    @Published var total = ""
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let budget = Budget(context: context)
            budget.title = title
            budget.total = Double(total) ?? 0
            try budget.save()
        } catch {
            print(error)
        }
    }
}

