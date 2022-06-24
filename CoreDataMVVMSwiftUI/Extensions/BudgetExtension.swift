//
//  BudgetExtension.swift
//  CoreDataMVVMSwiftUI
//
//  Created by Leandro Alves da Silva on 23/06/22.
//

import Foundation
import CoreData

extension Budget: BaseModel {
    static var all: NSFetchRequest<Budget> {
        let request = Budget.fetchRequest()
        request.sortDescriptors = []
        return request
    }
}
